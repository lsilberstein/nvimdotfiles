require('user.options')
require('user.keybinds')

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
	{'nvim-tree/nvim-web-devicons'},
	{'akinsho/bufferline.nvim'},
})

-- Plugin Options

require('lualine.lualine')
require('netwr/netwr')
