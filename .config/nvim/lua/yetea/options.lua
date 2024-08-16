local opt = vim.opt

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true

-- Wrapping
opt.wrap = false

-- Search
opt.ignorecase = false
opt.hlsearch = true
opt.incsearch = true

-- Cursor
opt.cursorline = true
opt.cursorlineopt = "number"

-- Colors and Appearance
opt.termguicolors = true
opt.background = "dark"
opt.list = true
opt.listchars = { tab = '│ ', trail = "·", space = "·", lead = "·" }

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Behavior
opt.splitright = true
opt.splitbelow = true

-- File Handling
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Command Line
opt.showmode = false
opt.showcmd = false
opt.cmdheight = 0

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Scrolling
opt.scrolloff = 10

-- Mouse
opt.mouse = ""

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

  return table.concat({ line_start .. suffix, line_end })
end

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext = 'v:lua.custom_fold_text()'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.fillchars = { eob = "-", fold = " " }
opt.foldenable = true
opt.foldnestmax = 3
opt.foldminlines = 1

-- Whitespace
vim.cmd([[
    match ExtraWhitespace /\s\+$/
    autocmd BufWritePre * %s/\s\+$//e
]])

-- Set highlight groups to match Nordic theme
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = function()
--     vim.cmd [[
--       highlight MiniTablineCurrent guifg=#81a1c1 guibg=#2E3440
--       highlight MiniTablineHidden guifg=#c0c8d8 guibg=#222630
--       highlight MiniTablineFill guifg=#2E3440 guibg=#191d24
--     ]]
--   end,
-- })
