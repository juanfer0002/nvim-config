return {
  "seblyng/roslyn.nvim",
  ft = { "cs", "razor" },
  opts = {
    filewatching = "neovim",

    exe = {
      "dotnet",
      vim.fs.joinpath(
        vim.fn.stdpath("data"),
        "mason",
        "packages",
        "roslyn",
        "Microsoft.CodeAnalysis.LanguageServer.dll"
      ),
    },

    config = {
      settings = {
        ["csharp|background_analysis"] = {
          dotnet_analyzer_diagnostics_scope = "openFiles",
          dotnet_compiler_diagnostics_scope = "openFiles",
        },

        ["razor|background_analysis"] = {
          dotnet_compiler_diagnostics_scope = "openFiles",
        },
      },
    },
  },
}
