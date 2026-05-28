return {
  "RRethy/vim-illuminate",
  event = { "CursorMoved", "InsertLeave" },
  config = function()
    require("illuminate").configure({
      -- Configure filetypes to ignore
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "TelescopePrompt",
        "alpha",
        "neo-tree",
      },
    })
  end,
}
