local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true

opt.wrap = false

opt.ignorecase = false

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

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
opt.list = false
opt.listchars = ""
