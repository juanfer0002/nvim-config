-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local wk = require("which-key")

--
-- File path keymaps -  Register the group name
--
wk.add({
  { "<leader>fy", group = "+Yank/Copy" },
})

vim.keymap.set("n", "<leader>fyy", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied relative path: " .. path)
end, { desc = "Copy relative file path" })

vim.keymap.set("n", "<leader>fyY", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied absolute path: " .. path)
end, { desc = "Copy absolute file path" })

vim.keymap.set("n", "<leader>fyn", function()
  local path = vim.fn.expand("%:t")
  vim.fn.setreg("+", path)
  vim.notify("Copied filename: " .. path)
end, { desc = "Copy filename" })


--
-- Copilot
-- 
vim.keymap.set(
  "i",
  "<C-l>",
  "copilot#AcceptWord()",
  { expr = true, silent = true, desc = "Accept Copilot Word" }
)

vim.keymap.set(
  'i',
  '<C-j>',
  'copilot#Accept("\\<CR>")',
  { expr = true, replace_keycodes = false, desc = "Accept Copilot Suggestion" }
)

vim.g.copilot_no_tab_map = true


--
-- Terminal 
--
vim.keymap.set(
  "t",
  "<C-h>",
  "<C-\\><C-N><C-w>h",
  { desc = "Terminal: Go to left window" }
)

vim.keymap.set(
  "t",
  "<C-j>",
  "<C-\\><C-N><C-w>j",
  { desc = "Terminal: Go to down window" }
)

vim.keymap.set(
  "t",
  "<C-k>",
  "<C-\\><C-N><C-w>k",
  { desc = "Terminal: Go to up window" }
)

vim.keymap.set(
  "t",
  "<C-l>",
  "<C-\\><C-N><C-w>l",
  { desc = "Terminal: Go to right window" }
)

vim.keymap.set(
  "t",
  "<C-q>",
  "<C-\\><C-N>",
  { desc = "Terminal: Exit terminal mode" }
)

--
-- Line feed
--
vim.keymap.set(
  "n",
  "<M-o>",
  "o<Esc>k",
  { desc = "Insert line below" }
)

vim.keymap.set(
  "n",
  "<M-O>",
  "O<Esc>j",
  { desc = "Insert line above" }
)
