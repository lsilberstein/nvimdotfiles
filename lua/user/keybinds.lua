-- keybinds
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
vim.keymap.set('n', '<space><space>', '<cmd>Lexplore<cr>')
