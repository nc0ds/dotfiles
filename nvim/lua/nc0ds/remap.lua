vim.g.mapleader = ' '

-- nnoremap
vim.keymap.set('n', '<leader>ef', vim.cmd.Ex, {})

vim.keymap.set('n', '<C-k>', '<cmd>bp<CR>', {})
vim.keymap.set('n', '<C-j>', '<cmd>bn<CR>', {})

vim.keymap.set('n', '<C-u>', '<C-u>zz', {})
vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', 'n', 'nzz', {})
vim.keymap.set('n', 'N', 'Nzz', {})
vim.keymap.set('n', 'G', 'Gzz', {})

