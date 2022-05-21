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
opt.timeoutlen = 1000                       -- Time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 300                        -- Vim should update more frequently
opt.cursorline = true                       -- highlight the current line
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.scrolloff = 3                           -- Keep 3 lines above and below when scrolling
opt.sidescrolloff = 8                       -- Same as 'scrolloff' but for horisontal scrolling
opt.lazyredraw = true                       -- Prevents vim from redrawing in times it doesn't need too.
opt.showmode = true                         -- Adds the '-- INSERT --' at the bottom bar
opt.termguicolors = true                    -- set term gui colors (most terminals support this)

opt.colorcolumn = '80'                      -- 80 character limit on line

opt.completeopt = { "menuone", "noselect" } -- For better selection with cmp


-- Searching
opt.hlsearch = true                         -- highlight all matches on previous search pattern
opt.ignorecase = true                       -- ignore case in search patterns
opt.smartcase = true                        -- Ignore case unless uppercase

-- Tabbing
opt.tabstop = 4                             -- \t char = 4 spaces
opt.shiftwidth = 4                          -- 1 level of indentation is 4 spaces
opt.softtabstop = 4                         -- Tab is 4 spaces for inserting and deleting
opt.expandtab = true                        -- Tabs should always be spaces instead
opt.autoindent = true                       -- Automatically indent lines as you type

-- Enable later
-- opt.smartindent = true                      -- Make indenting smarter again

--opt.showtabline = 4                         -- always show tabs
--opt.conceallevel = 0                        -- so that `` is visible in markdown files
--opt.fileencoding = "utf-8"                  -- the encoding written to a file
--opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time

-- Auto commands

-- Have org files be 2 spaces for tabs and indentation
vim.api.nvim_exec([[ autocmd FileType org setlocal tabstop=2 shiftwidth=2 softtabstop=2 ]], false)

