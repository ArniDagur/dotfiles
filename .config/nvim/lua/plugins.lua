-- Disable builtin vim plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Auto update plugins on saving this file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- This declares all of our plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'ArniDagur/vimpeccable'
	use {
		'neovim/nvim-lspconfig',
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		}
	}
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'ArniDagur/nvim-snippy',
            'ArniDagur/cmp-snippy',
        },
		config = function() require('plugins.cmp') end,
    }
    use {
        'ArniDagur/lsp_signature.nvim',
        config = function() require('plugins.lsp_signature') end
    }
	use {
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	}
    -- Bootstrap a new install
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)

