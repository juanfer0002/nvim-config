return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "enter", -- Keep default behavior...
      ["<Tab>"] = { "accept", "fallback" }, -- ...but add Tab for accept
    },
  },
}
