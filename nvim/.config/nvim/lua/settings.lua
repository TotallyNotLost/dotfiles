vim.cmd("set ignorecase smartcase")
vim.cmd("set undofile")
vim.cmd("set number relativenumber")

local api = vim.api

-- Window management
api.nvim_set_keymap("n", "<leader>-", ":split<CR>", {})
api.nvim_set_keymap("n", "<leader>|", ":vsplit<CR>", {})

-- Helpers
api.nvim_set_keymap("n", "<A-s>", ":NvimTreeFindFileToggle<CR>:Trouble diagnostics toggle<CR>:Trouble symbols toggle<CR>", {})
