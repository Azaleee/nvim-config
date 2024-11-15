vim.g.norminette_auto_format = 1  -- Activer le formatage automatique après chaque sauvegarde
vim.g.norminette_disable_on_write = 0
--vim.api.nvim_set_keymap('n', '<Leader>n', ':Norminette<CR>', { noremap = true, silent = true })
vim.api.nvim_exec([[
  autocmd BufWritePre *.c,*.cpp Norminette
]], false)
