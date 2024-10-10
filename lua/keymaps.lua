local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local wk = require("which-key")

wk.add({
  {
    mode = { "n", "v" }, -- NORMAL and VISUAL modes
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  },
})
