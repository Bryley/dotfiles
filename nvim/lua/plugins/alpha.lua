
local function opts(shortcut)
    return {
        shortcut = shortcut,
        position = "center",
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }
end

local function on_press(cmd)
    return function ()
        local key = vim.api.nvim_replace_termcodes(cmd, true, false, true)
        vim.api.nvim_feedkeys(key, "normal", false)
    end
end

local buttons = {
    type = "group",
	val = {
        {
            type = "button",
            val = "New file",
            on_press = on_press("<cmd>enew<cr>"),
            opts = opts("e"),
        },
        {
            type = "button",
            val = "Load Last Session",
            on_press = on_press("<cmd>SessionManager load_last_session<cr>"),
            opts = opts("<F1>"),
        },
        {
            type = "button",
            val = "Find file",
            on_press = on_press("<cmd>Telescope find_files<cr>"),
            opts = opts("SPC f f"),
        },
        {
            type = "button",
            val = "Grep files",
            on_press = on_press("<cmd>Telescope live_grep<cr>"),
            opts = opts("SPC f g"),
        },
	},
    opts = {
        spacing = 1
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
					val = {
                        [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
                        [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
                        [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
                        [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
                        [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
                        [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
                    },
					opts = {
						position = "center",
						hl = "Function",
					},
				},
				{ type = "padding", val = 2 },
                buttons,
			},
		}
	end,
}
