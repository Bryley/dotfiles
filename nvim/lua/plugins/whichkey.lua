return {
	-- Register some extra keymap names
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local which_key = require("which-key")
		local opts = {
			mode = "n", -- NORMAL mode
			prefix = "<leader>",
		}
		local vopts = {
			mode = "v", -- VISUAL mode
			prefix = "<leader>",
		}
		which_key.register({
			a = {
				name = "AI",
				t = { "<cmd>NeoAIShortcut textify<cr>", "Textify" },
			},
		}, vopts)
		which_key.register({
			a = {
				name = "AI",
				a = { "<cmd>NeoAI<cr>", "Open NeoAI" },
				g = { "<cmd>NeoAIShortcut gitcommit<cr>", "Git Commit Message" },
			},
			f = {
				name = "Telescope",
				f = { "<cmd>Telescope find_files<cr>", "Files" },
				g = { "<cmd>Telescope live_grep<cr>", "Grep" },
				b = { "<cmd>Telescope buffers<cr>", "Buffers" },
				h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
				c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
				r = { "<cmd>Telescope registers<cr>", "Registers" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				C = { "<cmd>Telescope commands<cr>", "Commands" },
			},
			l = {
				name = "LSP",
				a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
				f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
				r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
				n = { "<cmd>lua require('nvim-navbuddy').open()<cr>", "Navbuddy" },
			},
			t = {
				name = "Table Mode",
				m = { "<cmd>call tablemode#Toggle()<cr>", "Toggle" },
				t = { "<cmd>Tableize<cr>", "Tableize" },
			},
			-- nvim-dap debugging
			d = {
				name = "Debug",
				d = { '<cmd>lua require("dapui").toggle()<CR>', "Open UI" },
				["<space>"] = { '<cmd>lua require("dap").continue()<CR>', "Continue" },
				t = { '<cmd>lua require("dap").terminate()<CR>', "Terminate" },
				j = { '<cmd>lua require("dap").step_over()<CR>', "Step Over" },
				i = { '<cmd>lua require("dap").step_into()<CR>', "Step Into" },
				o = { '<cmd>lua require("dap").step_out()<CR>', "Step Out" },
				b = { '<cmd>lua require("dap").toggle_breakpoint()<CR>', "Toggle Breakpoint" },
				c = {
					'<cmd>lua require("dap").set_breakpoint(vim.ui.input("Breakpoint condition: "))<CR>',
					"Breakpoint Condition",
				},
			},
		}, opts)
        which_key.setup({
            window = {
                border = "single", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,
            },
            plugins = {
                presets = {
                    -- This is because of a warning that pops up with neo-tree
                    windows = false, -- default bindings on <c-w>
                },
            },
        })
	end,
}
