require'nvim-treesitter.configs'.setup({
	ensure_installed = {
		'bash',
		'css',
		'dockerfile',
		'graphql',
		'html',
		'javascript',
		'json',
		'lua',
		'markdown',
		'markdown_inline',
		'scss',
		'tsx',
		'typescript',
		'vim',
		'yaml'
	},
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
})

local api = vim.api

-- :HL -> Save file and parse treesitter highlight
api.nvim_create_user_command(
	'HL',
	'write | edit | TSBufEnable highlight',
	{}
)

