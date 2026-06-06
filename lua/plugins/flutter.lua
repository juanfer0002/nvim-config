return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    ft = { "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        fvm = true,
        ui = {
          border = "rounded",
          notification_style = "native",
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
            project_config = true,
          },
        },
        debugger = {
          enabled = false,
        },
        lsp = {
          -- Disable dynamic file-watcher registration to avoid the Dart language
          -- server sending "**/**.dart" (invalid glob in Neovim 0.12+).
          -- Diagnostics, completions and hover are unaffected.
          capabilities = (function()
            local caps = vim.lsp.protocol.make_client_capabilities()
            caps.workspace.didChangeWatchedFiles.dynamicRegistration = false
            return caps
          end)(),
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
          on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            -- Navigation
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            -- Documentation / signature
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
            -- Refactor
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>cf", function()
              vim.lsp.buf.format({ async = true })
            end, opts)
            -- Diagnostics
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
          end,
        },
      })
    end,
  },
}
