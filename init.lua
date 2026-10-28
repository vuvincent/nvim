-- Ensure nvm node is in PATH for LSP servers when shell hasn't activated nvm
local function setup_node_path()
  local nvm_data = vim.fn.expand '~/.local/share/nvm'
  local default_file = vim.fn.expand '~/.nvm/alias/default'
  if vim.fn.filereadable(default_file) == 1 then
    local version = vim.fn.trim(vim.fn.readfile(default_file)[1])
    local node_bin = nvm_data .. '/v' .. version .. '/bin'
    if vim.fn.isdirectory(node_bin) == 1 and not vim.env.PATH:find(node_bin, 1, true) then
      vim.env.PATH = node_bin .. ':' .. vim.env.PATH
    end
  end
end
setup_node_path()

-- Leader must be set before lazy.nvim registers plugin `keys`, otherwise
-- <leader> in those specs expands to the default backslash.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'custom.plugins.lang',
  require 'custom.plugins.themes',
  require 'custom.plugins.git',
  require 'custom.plugins.ai',
  require 'custom.plugins.statusline',
  require 'custom.plugins.find',
  require 'custom.plugins.editor',
  require 'custom.plugins.misc',
}

require 'custom.settings'
require 'custom.keymaps'
require('custom.search').setup_telescope()
require('custom.formatter').setup()

if vim.g.colors_name == 'no-clown-fiesta' then
  -- no-clown-fiesta's numberline is a bit dark
  vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7d7d7d' })
end

require('custom.lang').setup()
require('custom.git').setup()

setThemeOS()
