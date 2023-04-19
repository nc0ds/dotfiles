require('nvim-tree').setup({
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
	},
	update_focused_file = {
		enable = true,
	},
	filters = {
		dotfiles = false,
		custom = {
			'^.git$',
		},
	},
	git = {
		ignore = false,
	},
})

vim.keymap.set('n', '<leader>b', '<cmd>NvimTreeToggle<CR>', {})

local function open_nvim_tree(data)
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	vim.cmd.cd(data.file)

	require('nvim-tree.api').tree.open()
end

vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

