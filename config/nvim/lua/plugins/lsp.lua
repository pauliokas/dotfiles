return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "kevinhwang91/nvim-ufo",
      "saghen/blink.cmp",
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
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      -- Native LSP configuration (Neovim 0.11+)
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      for _, server in ipairs(opts.ensure_installed) do
        vim.lsp.config[server] = { capabilities = capabilities }
        vim.lsp.enable(server)
      end

      -- LSP keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
    end,
  },
}
