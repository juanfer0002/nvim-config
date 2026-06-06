-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local wk = require("which-key")

-- Register the group name
wk.add({
  { "<leader>fy", group = "+Yank/Copy" },
})

-- Copy relative file path
vim.keymap.set("n", "<leader>fyy", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied relative path: " .. path)
end, { desc = "Copy relative file path" })

-- Copy absolute file path
vim.keymap.set("n", "<leader>fyY", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied absolute path: " .. path)
end, { desc = "Copy absolute file path" })

-- Copy file name
vim.keymap.set("n", "<leader>fyn", function()
  local path = vim.fn.expand("%:t")
  vim.fn.setreg("+", path)
  vim.notify("Copied filename: " .. path)
end, { desc = "Copy filename" })

