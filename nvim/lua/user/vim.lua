--[[
This file is used for vim keymappings
--]]

local opt = vim.opt

-- Must have options
opt.backup = false      -- Disables creating backup files
opt.swapfile = false                        -- creates a swapfile
--opt.clipboard = "unnamedplus"           -- allows neovim to access the system clipboard
opt.mouse = "a"                             -- allow the mouse to be used in neovim

opt.splitbelow = true                       -- force all horizontal splits to go below current window
opt.splitright = true                       -- force all vertical splits to go to the right of current window

opt.number = true                           -- set numbered lines
opt.relativenumber = true                   -- set relative numbered lines
opt.wrap = false                            -- display lines as one long line

opt.undofile = true                         -- Keeps undo history even on close
opt.updatetime = 300                        -- Vim should update more frequently
opt.cursorline = true                       -- highlight the current line
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.scrolloff = 5                           -- Keep 5 lines above and below when scrolling
opt.sidescrolloff = 8                       -- Same as 'scrolloff' but for horisontal scrolling
opt.lazyredraw = true                       -- Prevents vim from redrawing in times it doesn't need too.
opt.showmode = true                         -- Adds the '-- INSERT --' at the bottom bar

opt.colorcolumn = '80'                      -- 80 character limit on line

opt.completeopt = { "menuone", "noselect" } -- For better selection with cmp



-- Searching
opt.hlsearch = true                         -- highlight all matches on previous search pattern
opt.ignorecase = true                       -- ignore case in search patterns

-- Tabbing
opt.smartcase = true                        -- Ignore case unless uppercase
opt.smartindent = true                      -- Make indenting smarter again
opt.expandtab = true                        -- Convert tabs to spaces
opt.shiftwidth = 4                          -- The number of spaces inserted for each indentation
opt.tabstop = 4                             -- Insert 4 spaces for a tab

-- Enable later
--opt.showtabline = 4                         -- always show tabs
--opt.conceallevel = 0                        -- so that `` is visible in markdown files
--opt.fileencoding = "utf-8"                  -- the encoding written to a file
--opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
--opt.termguicolors = true                    -- set term gui colors (most terminals support this)
