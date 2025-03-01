vim.cmd("colorscheme kanagawa")

local api = vim.api

api.nvim_set_keymap("n", "<leader>-", ":split<CR>", {})
api.nvim_set_keymap("n", "<leader>|", ":vsplit<CR>", {})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").find_files()
    end
  end,
})
