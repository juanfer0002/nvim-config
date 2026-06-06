return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true, -- Adds a border to hover docs and signature help
      },
      views = {
        hover = {
          border = {
            style = "rounded",
          },
          position = { row = 2, col = 0 },
          win_options = {
            -- Overrides default highlights locally for this view
            winhighlight = {
              -- Normal = "CustomHoverBg",     -- Link text/bg to a custom group
              FloatBorder = "FloatHoverBorder", -- Link borders to a custom group
            },
          },
        },
      },
      lsp = {
        signature = {
          enabled = false,
        }
      }
    },
  },
}

