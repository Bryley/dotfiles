local status_ok, sniprun = pcall(require, "sniprun")
if not status_ok then
	return
end

sniprun.setup({
	selected_interpreters = { "Python3_fifo" },
	repl_enable = { "Python3_fifo" },
	display = { "Terminal" },
	display_options = {
		terminal_width = 55,
	},
})
