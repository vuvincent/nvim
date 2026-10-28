return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {}
    end,
  },
  {
    'mpiannucci/copy-context',
    opts = {
      disable_default_keymap = true,
    },
    keys = {
      { '<leader>cY', '<cmd>CopyFileContext<cr>', mode = 'n', desc = 'Copy file context' },
      { '<leader>cy', '<cmd>CopyLineContext<cr>', mode = { 'n', 'v' }, desc = 'Copy selection/line context' },
    },
  },
}
