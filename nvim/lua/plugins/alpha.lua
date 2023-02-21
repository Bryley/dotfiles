-- function btn(sc, txt, keybind)
-- 	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")
--
-- 	local opts = {
-- 		position = "center",
-- 		shortcut = sc,
-- 		cursor = 5,
-- 		width = 50,
-- 		align_shortcut = "right",
-- 		hl_shortcut = "Keyword",
-- 	}
-- 	if keybind then
-- 		local keybind_opts = { noremap = true, silent = true, nowait = true }
-- 		opts.keymap = { "n", sc_, keybind, keybind_opts }
-- 	end
--
-- 	local function on_press()
-- 		local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
-- 		vim.api.nvim_feedkeys(key, "t", false)
-- 	end
--
-- 	return {
-- 		type = "button",
-- 		val = txt,
-- 		on_press = on_press,
-- 		opts = opts,
-- 	}
-- end

local buttons = {
    type = "group",
	val = {
		type = "button",
		val = "New file",
		on_press = function ()
            local key = vim.api.nvim_replace_termcodes("<cmd>enew<cr>", true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
		end,
		-- opts = {
  --           shortcut = "e"
  --       },
	},
    -- btn("e", "New File", "<cmd>ene <cr>"),
    -- btn("<F1>", "Last Session"),
    -- btn("SPC f f", "Find File"),
    -- btn("SPC f g", "Find Text"),
}

-- TODO NTS: Creating dashboard

return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")

		return {
			layout = {
				{ type = "padding", val = 5 },
				{
					type = "text",
					val = "Neovim",
					opts = {
						position = "center",
						hl = "Function",
					},
				},
				{ type = "padding", val = 2 },
                -- buttons,
			},
		}
	end,
}
