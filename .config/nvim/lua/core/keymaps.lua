-- Leader Key Configuration
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Define the keymap variable for convenience
local keymap = vim.keymap

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

-- Buffers Navigation
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })
keymap.set("n", "<leader>bda", ":%bd|e#|bd#<CR>'\"", { desc = "Delete all buffers except current" })

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
