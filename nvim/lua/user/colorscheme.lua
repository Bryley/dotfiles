-- local colorscheme = "darkplus"
-- local colorscheme = "codedark"
local colorscheme = "vscode"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.cmd("colorscheme industry")
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
