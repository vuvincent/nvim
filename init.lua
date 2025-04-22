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
require 'custom.search'.setup_telescope()

require 'custom.formatter'.setup()

if (vim.g.colors_name == 'no-clown-fiesta') then
  -- no-clown-fiesta's numberline is a bit dark
  vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7d7d7d' })
end

require 'custom.lang'.setup()
require 'custom.git'.setup()
