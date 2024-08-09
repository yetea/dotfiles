local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes"
opt.numberwidth = 5
opt.statuscolumn = " %s%=%{v:relnum?v:relnum:v:lnum}%#WinSeparator#  "

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true

opt.wrap = false

opt.ignorecase = false

opt.cursorline = true
opt.cursorlineopt = "number"

opt.termguicolors = true
opt.background = "dark"
opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.showmode = false
opt.showcmd = false
opt.cmdheight = 0

opt.updatetime = 250
opt.timeoutlen = 300
opt.scrolloff = 10

opt.hlsearch = true
opt.incsearch = true

opt.mouse = ""
-- show tab and trailing characters
opt.list = true
opt.listchars = { tab = "┊ ", trail = "·", space = "·", lead = "·" }

-- Windows
opt.winblend = 0
opt.pumblend = 0
opt.pumheight = 10

-- Code folding
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Automatically remove trailing whitespace.
vim.cmd([[
    match ExtraWhitespace /\s\+$/
    autocmd BufWritePre * %s/\s\+$//e
]])
