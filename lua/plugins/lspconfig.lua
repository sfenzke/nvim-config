local lsp_configs = {
  Lua = {
      diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim", "Snacks" },
      },
  }
}


return {
-- Automatically adds lspconfig handers for all language servers installed by mason
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
  },

  opts = function()
    require('mason').setup()

    local capabilities = require("blink.cmp").get_lsp_capabilities()


    --@type MasonLspconfigSettings
    return {
    ensure_installed = {},
    automatic_installation = false,

    handlers = {
      -- this first function is the "default handler"
      -- it applies to every language server without a "custom handler"
      function(server_name)
        require("lspconfig")[server_name].setup({ capabilities = capabilities, settings = lsp_configs })
      end,
      },
    }
    end,
}
