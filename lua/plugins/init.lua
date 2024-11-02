return {
  {
    "mfussenegger/nvim-dap",
    lazy = true
  },
  {
    "leoluz/nvim-dap-go",
    ft="go",
    dependencies="mfussenegger/nvim-dap",
    config = function(_, opts)
      require('dap-go').setup(opts)
    end,
    lazy = true
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "configs.gitsigns"
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  -- {
  --   "stevearc/conform.nvim",
  --   -- event = 'BufWritePre', -- uncomment for format on save
  --   config = function()
  --     require "configs.conform"
  --   end,
  -- },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    -- "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    -- ft = { "python" },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "pyright",
        "gopls",
        "mypy",
        "ruff",
        "black",
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "emmet-language-server",
      },
    },
  },

  -- autocloser tags
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- "vim",
        -- "lua",
        -- "vimdoc",
        -- "html",
        -- "css",
        -- "javascript",
        -- "typescript",
        -- "tsx",
        "python",
        "go",
      },
    },
  },
}
