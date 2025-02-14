return {
  "saghen/blink.cmp",
  
  build = 'cargo build --release',
  
  dependencies = {
    "rafamadriz/friendly-snippets"
  },

version = "v0.*",

config = function()

  require("blink.cmp").setup({

    signature = { enabled = true }

  })
end
}
