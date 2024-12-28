return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "junegunn/fzf", build = "./install --bin" },
  },
  config = function()
    -- calling `setup` is optional for customization
    local fzflua = require("fzf-lua")
    fzflua.setup({})

    vim.keymap.set('n', '<C-p>', fzflua.files, { desc = 'List files' })
    vim.keymap.set('n', '<leader>b', fzflua.buffers, { desc = 'Find existing buffers' })
    vim.keymap.set('n', '<leader>sg', fzflua.live_grep, { desc = 'Search in project' })
    vim.keymap.set('n', '<leader>m', fzflua.git_status, { desc = 'Find modified files' })
    vim.keymap.set({'n', 'v'}, '<leader>ca', fzflua.lsp_code_actions, { desc = 'Code actions' })
  end
}
