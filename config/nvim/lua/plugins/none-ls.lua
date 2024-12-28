return {
	"nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
        null_ls.builtins.completion.spell,

        null_ls.builtins.diagnostics.commitlint,

        -- markdown
        null_ls.builtins.code_actions.textlint,

        null_ls.builtins.code_actions.refactoring,

        null_ls.builtins.code_actions.gitsigns,

        -- lua
				null_ls.builtins.formatting.stylua,

        -- typescript
        -- require("none-ls.code_actions.eslint_d"),
        -- require("none-ls.diagnostics.eslint_d"),
        -- require("none-ls.formatting.eslint_d"),
				--null_ls.builtins.formatting.prettier,

        -- python
        -- require("none-ls.diagnostics.flake8"),
				--null_ls.builtins.diagnostics.flake8,
				--null_ls.builtins.diagnostics.mypy,
				--null_ls.builtins.formatter.black,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
