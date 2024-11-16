-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.virtualedit = 'onemore' -- Allow cursor beyond last character

--vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.

vim.opt.colorcolumn = '121'   -- Highlight column
vim.opt.cursorline = true     -- Highlight current line

vim.opt.number = true         -- Display line numbers
vim.opt.relativenumber = true -- Display relative line numbers
vim.opt.showmatch = true      -- Show matching brackets/parenthesis
vim.opt.hlsearch = true       -- Highlight search terms
vim.opt.incsearch = true      -- Find as you type search
vim.opt.ignorecase = true     -- Case insesitive search
vim.opt.smartcase = true      -- Case sensitive when uc present
vim.opt.scrolloff = 10        -- Minimal number of screen lines to keep above and below the cursor
vim.opt.foldenable = false    -- Disable code folding

vim.opt.splitright = true     -- Puts new vsplit windows to the right of the current
vim.opt.splitbelow = true     -- Puts new split windows to the bottom of the current

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

-- Formatting
vim.opt.wrap = true           -- Wrap long lines
vim.opt.linebreak = true      -- Wrap lines at convenient points
vim.opt.autoindent = true     -- Indent at the same level of previous line
vim.opt.shiftwidth = 2        -- Use indents of 2 spaces
vim.opt.expandtab = true      -- Tabs are spaces
vim.opt.tabstop = 2           -- An indentation every four columns
vim.opt.softtabstop = 2       -- Let backspace delete indent
vim.opt.smartindent = true    -- Automatically inserts one extra level of indentation in some cases
vim.opt.termguicolors = true
