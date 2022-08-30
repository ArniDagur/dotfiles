-- this file contains general options

local opt = vim.opt
local g = vim.g

g.mapleader = ' '

opt.number = true
opt.wrap = false
opt.scrolloff = 5
opt.termguicolors = true
opt.title = true
opt.mouse = 'a'
vim.api.nvim_set_option('clipboard','unnamed')

-- tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.smarttab = true
-- opt.autoindent = true
-- opt.copyindent = true
-- opt.smartindent = true

-- searching
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.incsearch = true

-- buffers
opt.hidden = true
opt.autowrite = true
opt.autowriteall = true
opt.autoread = true
opt.undofile = true

-- turn off highlighting in json files
vim.cmd[[autocmd Filetype json setlocal syntax=OFF]]

-- configure how diagnostics are shown
vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = true,
    float = {
        show_header = true,
        source = 'always',
        border = 'rounded',
        focusable = false,
    },
    update_in_insert = false, -- default to false
    severity_sort = true, -- default to false
})

