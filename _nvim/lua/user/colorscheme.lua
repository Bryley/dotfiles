-- local colorscheme = "darkplus"
-- local colorscheme = "codedark"
-- local colorscheme = "vscode"
-- local colorscheme = "onedark_vivid"
-- local colorscheme = "tokyonight"
-- local colorscheme = "doom-one"
local colorscheme = "github_dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.cmd("colorscheme industry")
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
