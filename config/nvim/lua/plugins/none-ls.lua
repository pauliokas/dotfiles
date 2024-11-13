return {
	"nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
        -- lua
				null_ls.builtins.formatting.stylua,

        -- typescript
        require("none-ls.code_actions.eslint_d"),
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.formatting.eslint_d"),
				--null_ls.builtins.formatting.prettier,

        -- python
        require("none-ls.diagnostics.flake8"),
				--null_ls.builtins.diagnostics.flake8,
				--null_ls.builtins.diagnostics.mypy,
				--null_ls.builtins.formatter.black,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
