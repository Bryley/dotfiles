local status_ok, foldpreview = pcall(require, "fold-preview")
if not status_ok then
	return
end

foldpreview.setup()
