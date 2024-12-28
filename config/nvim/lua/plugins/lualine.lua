return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'chrisgrieser/nvim-recorder',
      opts = {},
    },
  },

  opts = {
    options = {
      theme = 'dracula',
    },
    extensions = { 'neo-tree' },
  },
}

