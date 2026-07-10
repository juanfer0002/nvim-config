return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker = opts.picker or {}
    opts.picker.sources = opts.picker.sources or {}

    for _, source in ipairs({ "files", "smart", "recent", "grep", "explorer" }) do
      opts.picker.sources[source] = vim.tbl_deep_extend("force", opts.picker.sources[source] or {}, { hidden = true })
    end

    opts.picker.sources["grep"].search = function()
      local History = require("snacks.picker.util.history")
      local hist_store = History.new("picker_grep")
      local records = hist_store.kv and hist_store.kv.data or {}

      if #records ==0 then return "" end

      local latest = records[#records]
      local search = latest.search or ""

      local regex = ".*(%-%-.*)"
      if search:match(regex) then
        return search:gsub(regex, "%1")
      end

      return ""
    end

    opts.picker.sources["grep"].on_show = function(picker)
      vim.api.nvim_win_set_cursor(picker.input.win.win, { 1, 0 })
    end

    opts.indent = opts.indent or {}
    opts.indent.enabled = true
    opts.indent.only_scope = false
    opts.indent.only_current = false

    opts.indent.indent = {
      enabled = false,
    }

    opts.indent.scope = {
      enabled = true,
      only_current = false,
      -- char = "|"
    }

    opts.styles = opts.styles or {}

    opts.styles.notification = opts.styles.notification or {}
    opts.styles.notification.wo = { wrap = true }
  end,
}
