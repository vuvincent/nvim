return {
  { 'j-hui/fidget.nvim', opts = {} },

  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = { { path = '${3rd}/luv/library', words = { 'vim%.uv' } } },
    },
  },

  {
    'saghen/blink.cmp',
    version = '*',
    opts = {
      keymap = {
        preset = 'none',
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-Space>'] = { 'show', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      completion = { documentation = { auto_show = true } },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
    },
    branch = 'main',
    build = ':TSUpdate',
  },

  { 'gleam-lang/gleam.vim' },
  { 'stevearc/conform.nvim' },
}
