return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      automatic_installation = true,

      ensure_installed = {
        "jsonls",
        "lua_ls",
        "pylsp",
        "terraformls",
        "ts_ls",
      },

      -- handlers = {
      --   function (server_name)
      --     local capabilities = require('blink.cmp').get_lsp_capabilities()
      --     require('lspconfig')[server_name].setup({ capabilities = capabilities })
      --   end,
      -- },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "kevinhwang91/nvim-ufo",
      "saghen/blink.cmp",
    },
    config = function(_, opts)
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require("mason-lspconfig").setup_handlers({
        function (server_name)
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show declaration' })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
    end
  },
}

