return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = false,
          auto_trigger = true,
          keymap = {
            next = '<C-j>',
            prev = '<C-k>',
            accept = '<C-l>',
            dismiss = '<C-h>',
          },
        },
      }
    end,
  },
}
