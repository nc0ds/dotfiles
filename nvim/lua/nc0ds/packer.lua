require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'HiPhish/nvim-ts-rainbow2'
	use 'tpope/vim-fugitive'
	use {
		'mattn/emmet-vim',
		setup = function()
			vim.g.user_emmet_leader_key = '<C-a>'
		end
	}
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup({})
		end
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
		}
	}
	use 'tpope/vim-commentary'
	use 'maxmellon/vim-jsx-pretty'
	use 'nvim-tree/nvim-tree.lua'
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('indent_blankline').setup({})
		end
	}
	use 'lukas-reineke/lsp-format.nvim'

	-- LSP
	use {
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
	}

	-- Themes
	use 'whatyouhide/vim-gotham'
	use 'patternina/haze.nvim'
	use {
		'daltonmenezes/aura-theme',
		rtp = 'packages/neovim'
	}
end)
