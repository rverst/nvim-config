local va = require('utils.vars')
local fn = require('utils.fn')

local repo = 'https://github.com/wbthomason/packer.nvim'
local path = fn.joinPath(va.dataPath, 'site', 'pack', 'packer', 'start', 'packer.nvim')
local cloneRepo = function()
	fn.execute('git clone '..repo..' '..path)
	vim.cmd('packadd packer.nvim')
end

local updateRepo = function()
	local c = ' && '
	if fn.isWindows then s = " ; " end
	local cmd = 'cd '..path..c..'git pull --ff-only --rebase=false --progress'
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


require('packer').startup(function()

	use {
		'qbthomason/packer.nvim'
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		config = function() require('plugins.telescope') end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		requires = {{'nvim-treesitter/playground'},
			{'windwp/nvim-autopairs'},
			{'windwp/nvim-ts-autotag'},
		},
		config = function() require('plugins.treesitter') end
	}

	use {
		'neovim/nvim-lspconfig',
		config = function() require('lsp') end,
	}

	use {
		'folke/which-key.nvim',
		config = function() require('plugins.which-key') end
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
		'norcalli/nvim-base16.lua'
	}

	use {
		'norcalli/nvim-colorizer.lua',
		config = function() require('colorizer').setup() end
	}
end, {
  display = {
	  open_fn = function()
		  return require('packer.util').float({border = 'single'})
	  end
  }
})

checkUpdate()
