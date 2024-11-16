return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    config = function()
      vim.cmd [[
        let test#strategy = "vimux"
      ]]
    end,
    keys = {
      {"<leader>t", "<cmd>TestNearest<cr>"},
      {"<leader>T", "<cmd>TestFile<cr>"},
      {"<leader>a", "<cmd>TestSuite<cr>"},
      {"<leader>l", "<cmd>TestLast<cr>"},
      {"<leader>g", "<cmd>TestVisit<cr>"},
    },
  },
}
