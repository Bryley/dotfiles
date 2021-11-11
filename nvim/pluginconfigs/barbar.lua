local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', opts)

---- Move to previous/next
--map('n', 'gB', ':BufferPrevious<CR>', opts)
--map('n', 'gb', ':BufferNext<CR>', opts)
---- Re-order to previous/next
----map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
----map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
---- Goto buffer in position...
--map('n', '1gb', ':BufferGoto 1<CR>', opts)
--map('n', '2gb', ':BufferGoto 2<CR>', opts)
--map('n', '3gb', ':BufferGoto 3<CR>', opts)
--map('n', '4gb', ':BufferGoto 4<CR>', opts)
--map('n', '5gb', ':BufferGoto 5<CR>', opts)
--map('n', '6gb', ':BufferGoto 6<CR>', opts)
--map('n', '7gb', ':BufferGoto 7<CR>', opts)
--map('n', '8gb', ':BufferGoto 8<CR>', opts)
--map('n', '9gb', ':BufferGoto 9<CR>', opts)
--map('n', '0gb', ':BufferLast<CR>', opts)
---- Close buffer
--map('n', '<leader>q', ':BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
--map('n', '<C-p>', ':BufferPick<CR>', opts)
-- Sort automatically by...
--map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
--map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
--map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)
--
