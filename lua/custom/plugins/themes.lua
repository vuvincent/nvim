local config = {
  {
    'aktersnurra/no-clown-fiesta.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('no-clown-fiesta').setup {
        options = {
          transparent = true, -- Enable this to disable the bg color
        },
      }
      -- vim.cmd 'colorscheme no-clown-fiesta'
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup {
        options = {
          terminal_colors = true,
          transparent = true,
        },
      }
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
    config = function()
      -- vim.cmd 'colorscheme techbase'
    end,
    priority = 1000,
  },
}

function setThemeOS()
  local handle = io.popen 'defaults read -g AppleInterfaceStyle 2>/dev/null'
  if not handle then
    return
  end
  local result = handle:read '*a'
  handle:close()

  if result:match 'Dark' then
    vim.o.background = 'dark'
    vim.cmd 'colo github_dark_high_contrast'
  else
    vim.o.background = 'light'
    vim.cmd 'colo github_light_high_contrast'
  end
end

return config
