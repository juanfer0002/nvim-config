return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker = opts.picker or {}
    opts.picker.sources = opts.picker.sources or {}

    for _, source in ipairs({ "files", "smart", "recent", "grep", "explorer" }) do
      opts.picker.sources[source] = vim.tbl_deep_extend("force", opts.picker.sources[source] or {}, { hidden = true })
    end
  end,
}
