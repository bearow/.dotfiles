return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind-nvim")
  use("nvim-lua/lsp_extensions.nvim")
  use("glepnir/lspsaga.nvim")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use 'nvim-lua/plenary.nvim'

  use 'TimUntersberger/neogit'

  use 'nvim-telescope/telescope.nvim'

  use 'ThePrimeagen/harpoon'

  use 'folke/tokyonight.nvim'
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })

  use 'nvim-treesitter/playground'
  use 'romgrk/nvim-treesitter-context'

  --[[
  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]--[['
  }

  -- Plugins can have dependencies on other plugins
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  -- Plugins can also depend on rocks from luarocks.org:
  use {
    'my/supercoolplugin',
    rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  }
  
  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}--]]
end)
