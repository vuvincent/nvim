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
}

-- What the terminal itself reported over OSC 11 before anything below overrode
-- it. Captured once, since setThemeOS writes to `background` and would otherwise
-- just read its own answer back.
local terminal_background = vim.o.background

local function macIsDark()
  -- key only exists when dark mode is on, so the read fails in light mode
  local handle = io.popen 'defaults read -g AppleInterfaceStyle 2>/dev/null'
  if not handle then
    return true
  end
  local result = handle:read '*a'
  handle:close()
  return result:match 'Dark' ~= nil
end

local function osIsDark()
  if vim.fn.has('mac') == 1 then
    return macIsDark()
  end

  -- No OS appearance to read on the Linux dev box, so ask the things that do
  -- know, most live first: tmux's own palette (so the editor and status line can
  -- never disagree, and prefix+T updates both), then the mode the client
  -- forwarded for this session, then the terminal's reported background.
  if vim.env.TMUX then
    local mode = vim.trim(vim.fn.system { 'tmux', 'show', '-gv', '@sl_mode' })
    if vim.v.shell_error == 0 and mode ~= '' then
      return mode == 'dark'
    end
  end
  if vim.env.TMUX_THEME and vim.env.TMUX_THEME ~= '' then
    return vim.env.TMUX_THEME:lower() == 'dark'
  end
  return terminal_background == 'dark'
end

function setThemeOS()
  local dark = osIsDark()
  local colorscheme = dark and 'github_dark_high_contrast' or 'github_dark_high_contrast'
  if vim.g.colors_name ~= colorscheme then
    vim.o.background = dark and 'dark' or 'light'
    vim.cmd('colo ' .. colorscheme)
  end
end

-- re-check when coming back to the terminal (e.g. after toggling OS appearance)
vim.api.nvim_create_autocmd('FocusGained', {
  group = vim.api.nvim_create_augroup('ThemeOS', { clear = true }),
  callback = setThemeOS,
})

return config
