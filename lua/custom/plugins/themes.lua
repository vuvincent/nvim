local config = {
  {
    'aktersnurra/no-clown-fiesta.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('no-clown-fiesta').setup {
        -- transparent = true, -- Enable this to disable the bg color
      }
    end,
  },
  { 'projekt0n/github-nvim-theme',
    config = function()
      vim.cmd('colorscheme github_dark_high_contrast')
    end
  },
}

return config
