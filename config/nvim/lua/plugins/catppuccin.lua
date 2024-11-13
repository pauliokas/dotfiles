return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "auto",
    background = {},
  },
  config = function()
    vim.cmd.colorscheme('catppuccin')
  end
}
