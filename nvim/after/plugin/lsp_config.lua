-- Global config
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

local lsp_format = require('lsp-format')

local format_config = {
	tab_width = 2,
	arrow_parens = 'always',
	bracket_spacing = true,
	bracket_same_line = false,
	jsx_single_quote = true,
	print_width = 80,
	quote_props = 'as-needed',
	semi = true,
	single_attribute_per_line = true,
	single_quote = true,
	trailing_comma = 'es5',
	use_tabs = true,
}

lsp_format.setup({
	html = format_config,
	css = format_config,
	javascript = format_config,
	typescript = format_config,
	javascriptreact = format_config,
	typescriptreact = format_config,
	scss = format_config,
	yaml = format_config,
})

lsp_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lsp_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

local servers = {
	'lua_ls',
	'cssls',
	'cssmodules_ls',
	'dockerls',
	'graphql',
	'html',
	'jsonls',
	'tsserver',
	'marksman',
	'tailwindcss',
}

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = servers,
	automatic_installation = true
})

local on_attach = function(client)
	lsp_format.on_attach(client)

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

-- LSP Servers
for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150
		}
	})
end

-- Snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- Autocompletion
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = { behavior = cmp.SelectBehavior.Select }

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))

	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
	},
	window = {
		documentation = cmp.config.window.bordered()
	},
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['S-Tab'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-Space>'] = cmp.mapping(function(fallback)
			cmp.complete()
		end, { 'i', 's'})
	},
})

