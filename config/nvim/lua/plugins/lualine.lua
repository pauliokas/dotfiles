return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'dracula',
      -- icons_enabled = false,
      -- theme = 'molokai',
      -- component_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
    },
    extensions = { 'neo-tree' },
  },
}

