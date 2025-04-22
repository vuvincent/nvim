local M = {}

M.formatters = {}

function M.setup()
  require('conform').setup {
    formatters_by_ft = {
      -- Formatter for lua
      lua = { 'stylua' },
      -- Formatter for python
      python = { 'black' },
      -- Formatter for rust
      rust = { 'rustfmt' },
      -- Formatter for typescript
      typescript = { 'prettier' },
    },
  }

  vim.keymap.set('n', '<leader>fm', function()
    require('conform').format { async = true }
  end, { desc = 'Format current buffer with formatter' })
end

return M
