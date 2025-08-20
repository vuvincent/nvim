local config = {
  {
    'aktersnurra/no-clown-fiesta.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('no-clown-fiesta').setup {
        transparent = true, -- Enable this to disable the bg color
      }
      -- vim.cmd 'colorscheme no-clown-fiesta'
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    config = function()
      vim.cmd 'colorscheme github_dark_high_contrast'
    end,
  },
  {
    'stevedylandev/darkmatter-nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd 'colorscheme darkmatter'
    end,
  },
  {
    'mcauley-penney/techbase.nvim',
    opts = {
      transparent = true,
      style = 'dark',
    },
    -- init = function() vim.cmd.colorscheme("techbase") end,
    priority = 1000,
  },
}

return config
