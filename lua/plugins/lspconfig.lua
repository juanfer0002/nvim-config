return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        omnisharp = { enabled = false },
        html = {
          filetypes = { "html" },
        }
      },
    },
  },
}
