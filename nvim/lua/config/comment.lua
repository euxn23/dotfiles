require('Comment').setup()
vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', {})
vim.api.nvim_set_keymap('v', '<C-_>', 'gc', {})