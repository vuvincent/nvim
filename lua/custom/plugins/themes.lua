return {
  {
    'f-person/auto-dark-mode.nvim',
    config = function()
      require('auto-dark-mode').setup {
        update_interval = 1000,
        set_dark_mode = function()
          vim.api.nvim_set_option('background', 'dark')
        end,
        set_light_mode = function()
          vim.api.nvim_set_option('background', 'light')
        end,
      }
    end,
  },
  {
    'aktersnurra/no-clown-fiesta.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('no-clown-fiesta').setup {
        transparent = true, -- Enable this to disable the bg color
      }
      require('no-clown-fiesta').load()
    end,
  },
  {
    'datsfilipe/vesper.nvim',
    lazy = false,
    priority = 1000,
    opts = function()
      require('vesper').setup {
        transparent = true,  -- Boolean: Sets the background to transparent
        italics = {
          comments = false,  -- Boolean: Italicizes comments
          keywords = false,  -- Boolean: Italicizes keywords
          functions = false, -- Boolean: Italicizes functions
          strings = false,   -- Boolean: Italicizes strings
          variables = false, -- Boolean: Italicizes variables
        },
      }
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = function()
      require("rose-pine").setup({
        variant = "moon",  -- auto, main, moon, or dawn
        dark_variant = "moon", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true,      -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },
      })
      -- vim.cmd("colorscheme rose-pine")
      -- vim.cmd("colorscheme rose-pine-main")
      vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-dawn")
    end
  },
  {
    'gmr458/vscode_modern_theme.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('vscode_modern').setup {
        cursorline = true,
        transparent_background = false,
        nvim_tree_darker = true,
      }
    end,
  },
}
