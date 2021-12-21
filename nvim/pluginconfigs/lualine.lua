
-- Returns the virtual env that is currently activated with python
local function virtualenv()
	local shell = io.popen("which python3")
	local result = shell:read()
	shell:close()

	return result
end


require'lualine'.setup({
	options = {
		theme = 'auto'
	},
--	sections = {
--		lualine_c = {'filename', virtualenv}
--	}
})
