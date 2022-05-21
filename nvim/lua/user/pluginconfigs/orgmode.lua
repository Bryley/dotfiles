local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
  return
end

-- Treesitter grammar
orgmode.setup_ts_grammar()

orgmode.setup {
    org_agenda_files = {'~/Dropbox/org_files/*'},
    org_hide_leading_stars = true,
}

-- Setup extra plugins

local status_ok2, orgmode_bullets = pcall(require, "org-bullets")
if status_ok2 then
    orgmode_bullets.setup {
        symbols = { "◉", "○", "✸", "✿" }
    }
end
