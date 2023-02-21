local nullls = require("null-ls")

nullls.setup({
	sources = {
		-- TODO put these in the install scripts
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettier.with({
			extra_args = { "--tab-width", "4" },
		}),
		require("null-ls").builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "mysql" }, -- change to your dialect
		}),
	},
})
