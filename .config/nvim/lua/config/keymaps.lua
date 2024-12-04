-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })
keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape insert mode" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save current file" })

-- Selection
keymap.set("n", "<leader>sa", "ggVG", { desc = "Select all" })
keymap.set("n", "<leader>pa", "ggVGp", { desc = "Select all and paste" })
keymap.set("n", "<leader>L", "vg_", { desc = "Select to end of line" })
keymap.set("n", "<leader>gp", "`[v`]`", { desc = "Select pasted text" })

-- Clipboard and Deleting
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Miscellaneous
keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
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
