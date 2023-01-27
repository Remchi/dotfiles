vim.g.mapleader = ' '

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.title = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.shell = 'zsh'
vim.opt.scrolloff = 3
vim.opt.signcolumn = 'yes:1'

-- search
vim.opt.inccommand = 'split'
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*', '*_build/*', '*.git/*' }
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- indent
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.wrap = false

-- tabs and spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- mouse and clipboard
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

-- highlights
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 15
