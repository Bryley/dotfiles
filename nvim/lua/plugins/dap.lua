return {
	-- Debugging
	{
		"mfussenegger/nvim-dap",
		config = function()
			-- Better Icons
			vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "Title", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = " ", texthl = "DiagnosticFloatingInfo", linehl = "", numhl = "" }
			)
			vim.fn.sign_define("DapStopped", { text = " ", texthl = "", linehl = "TermCursor", numhl = "" })

			local dap = require("dap")
			-- TODO make sure the virtual env is setup before trying
			dap.adapters.python = {
				type = "executable",
                command = "python3",
				args = { "-m", "debugpy.adapter" },
			}

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						return ".venv/bin/python"
					end,
				},
			}
		end,
	},

	-- Debugger user interface
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("dapui").setup()
		end,
	},
}
