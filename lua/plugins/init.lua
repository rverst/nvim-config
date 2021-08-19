local va = require('utils.vars')
local fn = require('utils.fn')

local repo = 'https://github.com/wbthomason/packer.nvim'
local path = fn.joinPath(va.dataPath, 'site', 'pack', 'packer', 'start', 'packer.nvim')
local cloneRepo = function()
  fn.execute('git clone ' .. repo .. ' ' .. path)
  vim.cmd('packadd packer.nvim')
end

local updateRepo = function()
  local c = ' && '
  if fn.isWindows then c = ' ; ' end
  local cmd = 'cd ' .. path .. c .. 'git pull --ff-only --rebase=false --progress'
  fn.execute(cmd)
end

local checkInstall = function()
  if not fn.exists(path) then
    cloneRepo()
    return
  end
end

local checkUpdate = function()
  if fn.isUpdate() then
    updateRepo()
    require('packer').sync()
  end
end

checkInstall()

local packer = require('packer')

packer.init({
  profile = {
    enable = true,
    threshold = 1 -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
  }
})

packer.startup({function(use)

  use {'wbthomason/packer.nvim'}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require('plugins.telescope') end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    --event = 'BufRead',
    after = 'telescope.nvim',
    run = {'TSUpdate'},
    requires = {
	{'nvim-treesitter/playground', opt = true},
	{'windwp/nvim-autopairs'},
	{'windwp/nvim-ts-autotag'}
    },
    config = function() require('plugins.treesitter') end
  }

  use {'neovim/nvim-lspconfig',
--       requires = {'alexaandru/nvim-lspupdate'},
       config = function() require('lsp') end
  }

  use {'glepnir/lspsaga.nvim', config = function() require('plugins.lspsaga') end}


  use {
    'nvim-telescope/telescope-dap.nvim',
    after = 'telescope.nvim',
    requires = {{'mfussenegger/nvim-dap'},
		{'Pocco81/DAPInstall.nvim'},
		{'nvim-telescope/telescope.nvim'},
		{'nvim-treesitter/nvim-treesitter'}
		},
    config = function() require('plugins.nvim-dap') end,
  }

  use {
    'rcarriga/nvim-dap-ui',
    requires = {'mfussenegger/nvim-dap'},
    config = function() require('plugins.nvim-dap-ui') end,
  }
  
  use {
    'theHamsta/nvim-dap-virtual-text',
     after = 'telescope-dap.nvim',
     config = function () require('plugins.nvim-dap-virtual-text') end,
  }


  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('plugins.gitsigns') end
  }

  use {'ray-x/go.nvim', config = function() require('plugins.go-nvim') end}

  use {
    'mhartington/formatter.nvim',
    config = function() require('plugins.formatter') end,
    --rocks = {'luaformatter', {'luaformatter', version = '0.3.5'}}
  }

  use {'folke/which-key.nvim', config = function() require('plugins.which-key') end}

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('plugins.nvim-tree') end
  }

  use {
    'glepnir/galaxyline.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require('plugins.statusline') end
  }

  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require('plugins.bufferline') end
  }

  use {
    'hrsh7th/nvim-compe',
    event = 'InsertEnter',
    config = function() require('plugins.compe') end}

  use {
    'b3nj5m1n/kommentary',
    event = 'VimEnter',
    config = function() require('plugins.kommentary') end,
  }

  use {'norcalli/nvim-base16.lua'}

  use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end}

  use {'tweekmonster/startuptime.vim'}

end,
  config = {
    display = {
      open_fn = function()
	return require('packer.util').float({border = 'single'})
      end
    }
  }
})

checkUpdate()
