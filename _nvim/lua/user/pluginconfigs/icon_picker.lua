local status_ok, icon_picker = pcall(require, "icon-picker")
if not status_ok then
  return
end

icon_picker.setup({
  disable_legacy_commands = true
})
