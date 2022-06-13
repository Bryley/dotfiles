local status_ok, rusttools = pcall(require, "rust-tools")
if not status_ok then
  return
end

rusttools.setup({})
