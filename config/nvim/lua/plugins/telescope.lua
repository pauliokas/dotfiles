return {
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'CFLAGS=-march=native make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local telescope = require('telescope')

      telescope.setup({
        pickers = {
          buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
          },
        },

        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({

            })
          },
        },
      })

      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find existing buffers' })
      vim.keymap.set('n', '<leader>m', builtin.git_status, { desc = 'Find modified files' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search by Grep' })
      -- vim.keymap.set('n', '<leader>fu', builtin.lsp_document_symbols, { desc = 'Find symbols in document' })
    end,
  },
}

