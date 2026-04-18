local function ai_status()
  local s = require('nvim-context').status()
  if s.claude or s.mcp then
    return '󰚩'
  end
  return ''
end

return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        sections = {
          lualine_c = { 'filename', ai_status },
        },
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = '|',
          section_separators = '',
        },
      }
    end,
  },
}
