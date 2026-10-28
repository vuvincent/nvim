-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Yanks should reach the laptop's clipboard even when this config runs on the remote
-- dev box, which has no clipboard tool of its own. Copies go out as OSC 52, which the
-- terminal (or herdr) hands to whichever machine is actually being sat at. Pastes read
-- Neovim's own register rather than querying the terminal, because nothing on that path
-- answers an OSC 52 read and every `p` would stall waiting for one.
local function has_native_clipboard()
  if vim.fn.has('mac') == 1 or vim.fn.has('win32') == 1 then
    return true
  end
  if vim.env.WAYLAND_DISPLAY ~= nil and (vim.fn.executable('wl-copy') == 1 or vim.fn.executable('waycopy') == 1) then
    return true
  end
  if vim.env.DISPLAY ~= nil and (vim.fn.executable('xclip') == 1 or vim.fn.executable('xsel') == 1) then
    return true
  end
  return false
end

if not has_native_clipboard() then
  local osc52 = require('vim.ui.clipboard.osc52')
  local copy = osc52.copy('+')
  local function paste()
    return { vim.fn.getreg('"', 1, true), vim.fn.getregtype('"') }
  end
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = { ['+'] = copy, ['*'] = copy },
    paste = { ['+'] = paste, ['*'] = paste },
  }
end

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- relative line number
vim.o.relativenumber = true

-- cursorline
vim.wo.cursorline = true

-- split vertical to the right always
vim.o.splitright = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- tabs
vim.opt.tabstop = 4       -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4    -- Number of spaces used for each step of auto-indent
vim.opt.expandtab = true  -- Use spaces instead of tabs

-- window border
vim.o.winborder = 'rounded'

-- store swap files in a central location to avoid issues with special chars in paths (e.g. Next.js [id] routes)
vim.opt.directory = vim.fn.stdpath('state') .. '/swap//'
