-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

-- Fix End-Of-File (EOF) to always include an empty line
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*",
--   callback = function()
--     local last_line = vim.fn.line("$")
--     local last_content = vim.fn.getline(last_line)
--     if last_content ~= "" then
--       vim.fn.append(last_line, "")
--     end
--   end,
-- })

-- Stop all current LSP clients
vim.api.nvim_create_autocmd('VimLeavePre', {
  desc = 'Force stop LSP clients on exit',
  callback = function()
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
      client.stop(client, false)
    end
  end,
})

-- Set conceallevel to 0 for all filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

