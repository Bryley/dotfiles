
-- Set target to be tmux instead of screen
vim.g.slime_target = "tmux"

vim.api.nvim_exec([[ let g:slime_paste_file = tempname() ]], false)
vim.api.nvim_exec([[ let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"} ]], false)
