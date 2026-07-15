-- Highlight when yanking (copying) text
--
-- NOTE: Filetype detections for gotmpl and helm are also defined here.
-- Helm charts: files under a templates/ directory or *.tpl files are set to 'helm'.
-- gotmpl: html files containing '{{' are set to 'gotmpl'.

-- Enable text wrap for prose/output windows where it is always wanted
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable wrap and linebreak for output/prose windows',
  group = vim.api.nvim_create_augroup('rv-textwrap', { clear = true }),
  pattern = { 'dap-repl', 'snacks_notify_history' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- Enable treesitter highlighting
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable treesitter highlighting if parsers are available for the filetype',
  group = vim.api.nvim_create_augroup('rv-treesitter-hl', { clear = true }),
  callback = function(args)
    local ft = args.match
    local lang = vim.treesitter.language.get_lang(ft)
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(args.buf, lang)
    end
  end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('rv-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = 'Set filetype to gotmpl when detecting `{{` in an html file',
  group = vim.api.nvim_create_augroup('rv-filetype-gotmpl', { clear = true }),
  pattern = { '*.html', '*.htm' },
  callback = function(ev)
    -- Only proceed if the current filetype is html
    if vim.bo[ev.buf].filetype ~= 'html' then
      return
    end
    local lines = vim.api.nvim_buf_get_lines(ev.buf, 0, -1, false)
    for _, line in ipairs(lines) do
      if line:find('{{') then
        vim.bo[ev.buf].filetype = 'gotmpl'
        break
      end
    end
  end,
})

-- Detect OpenAPI specs by content: YAML/JSON files containing 'openapi:' or 'swagger:'
-- in the first 10 lines. Keeps the original filetype (yaml/json) for LSP schema
-- validation, but sets b:is_openapi = true so nvim-lint can run vacuum on them.
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = 'Detect OpenAPI / Swagger specs by content and enable vacuum linting',
  group = vim.api.nvim_create_augroup('rv-filetype-openapi', { clear = true }),
  pattern = { '*.yaml', '*.yml', '*.json' },
  callback = function(ev)
    local lines = vim.api.nvim_buf_get_lines(ev.buf, 0, 10, false)
    for _, line in ipairs(lines) do
      if line:match('^openapi%s*:') or line:match('^swagger%s*:') then
        vim.b[ev.buf].is_openapi = true
        -- Run vacuum in addition to the filetype's default linters.
        -- nvim-lint does not support per-buffer linter injection natively,
        -- so we fire it via an explicit try_lint call after the buffer is ready.
        vim.schedule(function()
          local ok, lint = pcall(require, 'lint')
          if ok then
            lint.try_lint('vacuum')
          end
        end)
        break
      end
    end
  end,
})

-- Detect Helm chart templates: files inside a templates/ directory or *.tpl files
-- are set to 'helm' filetype so helm_ls and gotmpl treesitter injections work.
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = 'Set filetype to helm for chart template files',
  group = vim.api.nvim_create_augroup('rv-filetype-helm', { clear = true }),
  pattern = { '*/templates/*.yaml', '*/templates/*.yml', '*/templates/*.tpl', '*.tpl' },
  callback = function(ev)
    -- Only set helm if inside a chart (Chart.yaml exists somewhere above)
    local path = vim.api.nvim_buf_get_name(ev.buf)
    local dir = vim.fn.fnamemodify(path, ':h')
    local found = false
    -- Walk up to 4 levels to find Chart.yaml
    for _ = 1, 4 do
      if vim.fn.filereadable(dir .. '/Chart.yaml') == 1 then
        found = true
        break
      end
      local parent = vim.fn.fnamemodify(dir, ':h')
      if parent == dir then
        break
      end
      dir = parent
    end
    if found then
      vim.bo[ev.buf].filetype = 'helm'
    end
  end,
})
