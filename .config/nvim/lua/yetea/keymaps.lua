-- Leader Key Configuration
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Define the keymap variable for convenience
local keymap = vim.keymap

local set_colorscheme = function(name)
  pcall(vim.cmd, "colorscheme " .. name)
end
local pick_colorscheme = function()
  local init_scheme = vim.g.colors_name
  local new_scheme = require("mini.pick").start({
    source = {
      items = vim.fn.getcompletion("", "color"),
      preview = function(_, item)
        set_colorscheme(item)
      end,
      choose = set_colorscheme,
    },
    mappings = {
      preview = {
        char = "<C-p>",
        func = function()
          local item = require("mini.pick").get_picker_matches()
          pcall(vim.cmd, "colorscheme " .. item.current)
        end,
      },
    },
  })
  if new_scheme == nil then
    set_colorscheme(init_scheme)
  end
end

-- Insert Mode Keymaps
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })
keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape insert mode" })

-- Normal Mode Keymaps
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save current file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit current window" })

-- Search and Highlighting
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "*", "*zzzv", { desc = "Search forward and center" })
keymap.set("n", "#", "#zzzv", { desc = "Search backward and center" })
keymap.set("n", ",", ",zzzv", { desc = "Repeat last search in opposite direction and center" })
keymap.set("n", ";", ";zzzv", { desc = "Repeat last character search and center" })
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })
keymap.set("n", "<leader>fc", pick_colorscheme, { noremap = true, silent = true, desc = "Change Colorscheme" })

-- Selection
keymap.set("n", "<leader>sa", "ggVG", { desc = "Select all" })
keymap.set("n", "<leader>pa", "ggVGp", { desc = "Select all and paste" })
keymap.set("n", "<leader>L", "vg_", { desc = "Select to end of line" })
keymap.set("n", "<leader>gp", "`[v`]`", { desc = "Select pasted text" })

-- Buffers Navigation
keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })
keymap.set("n", "<leader>bk", "<cmd>%bd|e#|bd#<CR>'\"", { desc = "Delete all buffers except current" })

-- Editing and Indentation
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Clipboard and Deleting
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- LSP Actions
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol under cursor" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show available code actions" })
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration of symbol" })

-- Miscellaneous
keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
keymap.set("n", "j", "gj", { desc = "Move down by display line" })
keymap.set("n", "k", "gk", { desc = "Move up by display line" })
keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" }
)
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "Source current file" })

-- Vim visual multi
local function visual_cursors_with_delay()
  -- Execute the vm-visual-cursors command.
  vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
  -- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
  vim.cmd("sleep 200m")
  -- Press 'A' in normal mode after the delay.
  vim.cmd('silent! execute "normal! A"')
end
keymap.set("n", "<leader>va", "<Plug>(VM-Select-All)<Tab>", { desc = "Select all instances" })
keymap.set("n", "<leader>vr", "<Plug>(VM-Start-Regex-Search)", { desc = "Start regex search for multiple cursors" })
keymap.set("n", "<leader>vp", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "Add cursor at specified position" })
keymap.set("v", "<leader>vv", visual_cursors_with_delay, { desc = "Create visual cursors with delay" })
keymap.set("n", "<leader>vo", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle Visual Multi key mappings" })

-- Diagnostic navigation
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
keymap.set("n", "[e", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Go to next error" })
keymap.set("n", "]e", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Go to previous error" })
keymap.set("n", "[w", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Go to next warning" })
keymap.set("n", "]w", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Go to previous warning" })
