local api = vim.api

-- :CBO -> Delete all buffers but the current one
api.nvim_create_user_command(
	'CBO',
	'%bd!|e#|bd#',
	{}
)
