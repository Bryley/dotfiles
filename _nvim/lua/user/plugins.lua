--[[
This file includes all new plugins to install and also sets up the `packer`
plugin manager for vim.
--]]

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

    -- Dependencies
    use "wbthomason/packer.nvim"            -- Have packer manage itself
    use "nvim-lua/popup.nvim"               -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"             -- Useful lua functions used by lots of plugins
    use 'stevearc/dressing.nvim'            -- Adds better UI for selections in different plugins
    use "kyazdani42/nvim-web-devicons"      -- Adds NERD font icons to different plugins.
    use {                                   -- Uses parser for better syntax highlighting.
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "moll/vim-bbye"                     -- Creates better buffer deleting
    use "kana/vim-textobj-user"             -- Dependency for vim-textobj-numberal
    use 'anuvyklack/keymap-amend.nvim'      -- Keymap plugin for fold preview

    -- Essentials
    use "kylechui/nvim-surround"            -- Ability to change surrounding characters on text objects.
    use "tkhren/vim-textobj-numeral"        -- Adds text object 'n' for number
    use "karb94/neoscroll.nvim"             -- Smooth scrolling for neovim
    use "ggandor/leap.nvim"                 -- Navigation plugin for jumping around file
    use "AndrewRadev/sideways.vim"          -- Adds ':Sideways<Left|Right>' for swapping objects
    use "p00f/nvim-ts-rainbow"              -- Adds rainbow brackets
    use "nvim-treesitter/nvim-treesitter-textobjects" -- Adds extra text objects like function and class
    use "nvim-treesitter/playground"        -- Shows AST for current code using treesitter
    use "folke/which-key.nvim"              -- When pressing leader gives hints for remembering
    use "terrortylor/nvim-comment"          -- Commenting plugin
    use "iamcco/markdown-preview.nvim"      -- Plugin for previewing markdown
    use "Bryley/docstr.nvim"                -- My custom docstring plugin
    use "danymat/neogen"                    -- Documentation Generator
    use 'norcalli/nvim-colorizer.lua'       -- Color preview
    use 'ziontee113/icon-picker.nvim'       -- Icon picking plugin
    use 'Shatur/neovim-session-manager'     -- Session Manager for nvim
    use 'junegunn/vim-easy-align'           -- Aligns code/text like csv files
    use 'johmsalas/text-case.nvim'          -- Text altering with snake and camel case
    use {'michaelb/sniprun', run = 'bash ./install.sh'} -- Send code to repl

    -- Org mode Stuff
    use { 'nvim-neorg/neorg', run = ":Neorg sync-parsers" } -- Neovim version of Org mode
    -- use 'nvim-orgmode/orgmode'              -- Neovim Orgmode
    -- use 'akinsho/org-bullets.nvim'          -- Add more stylish bullets
    -- use 'lukas-reineke/headlines.nvim'      -- Adds highlighting to headlines and source code
    use 'dhruvasagar/vim-table-mode'        -- Better nvim table support (TODO play around with it)

    -- IDE like
    use "kyazdani42/nvim-tree.lua"          -- Adds better file navigator to the side (TODO give neotree a try instead)
    use {
        "akinsho/bufferline.nvim",          -- Adds buffer line to top bar
        branch="main"
    }
    use "nvim-telescope/telescope.nvim"     -- Fuzzy finder plugin
    use 'mfussenegger/nvim-dap'             -- Base debugger
    use 'rcarriga/nvim-dap-ui'              -- Handy UI for nvim-dap debugger
    use 'goolord/alpha-nvim'                -- Cool looking start page
    use {
        "akinsho/toggleterm.nvim",          -- Better terminals inside nvim
        branch="main"
    }
    -- use 'jpalardy/vim-slime'                -- Vim + TMUX support
    -- use 'rust-lang/rust.vim'                -- Rust language support
    use 'simrat39/rust-tools.nvim'          -- Rust Tools
    -- Disabled plugins as they clashed with neorg
    -- use 'anuvyklack/pretty-fold.nvim'       -- Pretty Folds with zf
    -- use 'anuvyklack/fold-preview.nvim'      -- Have preview of folds when hovering
    use 'folke/trouble.nvim'                -- List of project wide diagnostics

    -- LSP
    use "neovim/nvim-lspconfig"             -- LSP setup for Neovim
    use "jose-elias-alvarez/null-ls.nvim"   -- A plugin that allows external formatters and linters to work with LSP
    -- use {
    --     "williamboman/mason.nvim",          -- Installer for LSP servers, linters and formatters
    --     "jose-elias-alvarez/null-ls.nvim",  -- A plugin that allows external formatters and linters to work with LSP
    --     "jayp0521/mason-null-ls.nvim",      -- Plugin for Mason for null-ls support
    --     "williamboman/mason-lspconfig.nvim",-- Plugin for LSP support with Mason
    --     "neovim/nvim-lspconfig",            -- LSP setup for Neovim
    --     "RubixDev/mason-update-all"         -- Plugin to update all packages at once in Mason
    -- }

    -- cmp plugins
    use "hrsh7th/nvim-cmp"                  -- The base auto completion plugin
    use "hrsh7th/cmp-nvim-lsp"              -- Enables LSP auto completion
    use "hrsh7th/cmp-buffer"                -- Enables buffer completions
    use "hrsh7th/cmp-path"                  -- Enables path completions
    use "hrsh7th/cmp-cmdline"               -- Enables cmdline completions
    use "hrsh7th/cmp-nvim-lua"              -- Enables nvim lua autocompletions
    use "saadparwaiz1/cmp_luasnip"          -- Enables snippet completions
    use "onsails/lspkind-nvim"              -- Adds better looking menu for cmp

    -- Snippets
    use "L3MON4D3/LuaSnip"                  -- Snippet engine
    use "rafamadriz/friendly-snippets"      -- A bunch of snippets to use

    -- Colorschemes and Styling plugins
    -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use 'nvim-lualine/lualine.nvim'         -- Adds better bottom bar
    use 'tomasiser/vim-code-dark'           -- vscode like colourschemes
    use 'Mofiqul/vscode.nvim'               -- Another vscode theme
    use 'NTBBloodbath/doom-one.nvim'        -- Doom theme
    use "olimorris/onedarkpro.nvim"         -- One dark pro theme
    use 'folke/tokyonight.nvim'             -- Tokyonight colorscheme
    use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }) -- Multiple cool looking themes

    use 'elkowar/yuck.vim'                  -- Language support for 'yuck' language

    -- Other
    use 'seandewar/nvimesweeper'            -- Adds minesweeper into nvim for fun
    use 'alec-gibson/nvim-tetris'           -- Adds Tetris into nvim for fun



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
