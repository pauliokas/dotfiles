return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "kevinhwang91/nvim-ufo",
      "saghen/blink.cmp",
    },
    config = function(_, opts)
      -- local capabilities = require('blink.cmp').get_lsp_capabilities()
      --
      -- require("mason-lspconfig").setup_handlers({
      --   function (server_name)
      --     print(capabilities)
      --     vim.lsp.config[server_name] = { capabilities = capabilities }
      --   end
      -- })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show declaration' })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
    end
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    opts = {
      automatic_installation = true,

      ensure_installed = {
        "jsonls",
        "lua_ls",
        "pylsp",
        "terraformls",
        "ts_ls",
        "gopls",
      },
    },
  },
}
