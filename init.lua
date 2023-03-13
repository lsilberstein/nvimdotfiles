require('user.options')

-- keybinds
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
vim.keymap.set('n', '<space><space>', '<cmd>Lexplore<cr>')

-- Plugin manager
local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim....')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable',
			path,
		})
	end
end

function lazy.setup(plugins)
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)
	require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
	-- list of plugins
	{'nvim-lualine/lualine.nvim'},
	{'joshdick/onedark.vim'},
})

-- Plugin Options

vim.cmd.colorscheme('onedark')
-- LuaLine
vim.opt.showmode = false
require('lualine').setup({
	options = {
		theme = 'onedark',
	},
})

-- netwr
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
