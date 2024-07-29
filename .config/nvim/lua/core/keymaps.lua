-- Leader Key Configuration
vim.g.mapleader = " "         -- Set space as the leader key
vim.g.maplocalleader = " "    -- Set space as the local leader key
vim.g.have_nerd_font = true   -- Indicate that NERD Font is available

-- Define the keymap variable for convenience
local keymap = vim.keymap

-- Insert Mode Keymaps
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })   -- Exit insert mode by pressing 'jj'
keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape insert mode" })      -- Use Ctrl+c to escape insert mode

-- Normal Mode Keymaps
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save current file" })  -- Save current file
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit current window" })-- Quit current window

-- Search and Highlighting
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })  -- Clear search highlights
keymap.set("n", "*", "*zzzv", { desc = "Search forward and center" })             -- Search forward and center
keymap.set("n", "#", "#zzzv", { desc = "Search backward and center" })            -- Search backward and center
keymap.set("n", ",", ",zzzv", { desc = "Repeat last search in opposite direction and center" })  -- Repeat last search in opposite direction and center
keymap.set("n", ";", ";zzzv", { desc = "Repeat last character search and center" })              -- Repeat last character search and center
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })         -- Go to next search result and center
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })     -- Go to previous search result and center

-- Buffers Navigation
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })  -- Delete current buffer

-- Editing and Indentation
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })                 -- Indent left and reselect
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })                -- Indent right and reselect

-- Clipboard and Deleting
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })  -- Paste without yanking the replaced text
keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })  -- Yank to system clipboard
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })  -- Yank entire line to system clipboard
keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without yanking" })  -- Delete without yanking the deleted text

-- LSP Actions
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol under cursor" })         -- Rename the variable under your cursor
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show available code actions" }) -- Execute a code action
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration of symbol" })   -- Go to declaration

-- Miscellaneous
keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })                        -- Disable Ex mode
keymap.set("n", "j", "gj", { desc = "Move down by display line" })                 -- Move down by display line
keymap.set("n", "k", "gk", { desc = "Move up by display line" })                   -- Move up by display line
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })  -- Search and replace word under cursor
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })  -- Make current file executable
keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Source current file" })  -- Source current file
