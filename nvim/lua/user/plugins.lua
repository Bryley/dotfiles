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
    use "nvim-lua/plenary.nvim"             -- Useful lua functions used ny lots of plugins
    use "kyazdani42/nvim-web-devicons"      -- Adds NERD font icons to different plugins.
    use {                                   -- Uses parser for better syntax highlighting.
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "moll/vim-bbye"                     -- Creates better buffer deleting

    -- Essentials
    use "tpope/vim-surround"                -- Ability to change surrounding characters on text objects.
    use "tpope/vim-repeat"                  -- Adds better repeatability for surround.vim
    use "psliwka/vim-smoothie"              -- Adds smooth scrolling
    use "p00f/nvim-ts-rainbow"              -- Adds rainbow brackets
    use "nvim-treesitter/playground"        -- Shows AST for current code using treesitter

    -- IDE like
    use "kyazdani42/nvim-tree.lua"          -- Adds better file navigator to the side
    use "akinsho/bufferline.nvim"           -- Adds buffer line to top bar
    use "nvim-telescope/telescope.nvim"     -- Fuzzy finder plugin
    use 'mfussenegger/nvim-dap'             -- Base debugger
    use 'rcarriga/nvim-dap-ui'              -- Handy UI for nvim-dap debugger

    -- LSP
    use 'neovim/nvim-lspconfig'             -- LSP setup
    use 'williamboman/nvim-lsp-installer'   -- Easy to use installer for LSP servers

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
    use "martinsione/darkplus.nvim"         -- Darkplus vscode like colorscheme



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
