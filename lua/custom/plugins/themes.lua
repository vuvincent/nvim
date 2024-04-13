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
        transparent = true, -- Boolean: Sets the background to transparent
        italics = {
          comments = false, -- Boolean: Italicizes comments
          keywords = false, -- Boolean: Italicizes keywords
          functions = false, -- Boolean: Italicizes functions
          strings = false, -- Boolean: Italicizes strings
          variables = false, -- Boolean: Italicizes variables
        },
      }
    end,
  },
  { 'rose-pine/neovim', name = 'rose-pine' },
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
