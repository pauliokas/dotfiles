return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  config = function ()
    require("ufo").setup({
      close_fold_kinds_for_ft = {
        default = {'imports'},
      }
    })

    vim.o.foldcolumn = "1"
  end
}
