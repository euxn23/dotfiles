require("nvim-tree").setup({
  remove_keymaps = true
})
vim.api.nvim_set_keymap('n', '<C-E>', ':NvimTreeToggle<CR>', { noremap = true })