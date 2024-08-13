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
opt.listchars = { trail = "·", space = "·", lead = "·" }

-- Windows
opt.winblend = 0
opt.pumblend = 0
opt.pumheight = 10

-- Folding
function _G.custom_fold_text()
  local line_start = vim.fn.getline(vim.v.foldstart)
  local line_end = vim.fn.getline(vim.v.foldend)
  local line_count = vim.v.foldend - vim.v.foldstart + 1
  local total_lines = vim.fn.line('$')
  local suffix = (" ...  %d %d%% "):format(line_count, line_count / total_lines * 100)
  local newline = vim.api.nvim_replace_termcodes("<CR>", true, true, true)

  return table.concat({ line_start .. suffix, line_end }, newline)
end

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext = 'v:lua.custom_fold_text()'
opt.foldlevel = 99
opt.foldlevelstart = 1
opt.fillchars = { eob = "-", fold = " " }
opt.foldenable = true
opt.foldnestmax = 3
opt.foldminlines = 1

-- Automatically remove trailing whitespace.
vim.cmd([[
    match ExtraWhitespace /\s\+$/
    autocmd BufWritePre * %s/\s\+$//e
]])
