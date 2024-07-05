-- vim.keymap.set('n', '<C-[>', ':e# <CR>', {})
vim.keymap.set('n', '<C-D>', ':t. <CR>', {})
vim.keymap.set('n', '<c-[>', ':bprevious<CR>', {})
vim.keymap.set('n', '<c-]>', ':bnext<CR>', {})
-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
