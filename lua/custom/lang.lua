local modules = {}

function modules.setup()
  local ensureInstalled = {
    'c',
    'cpp',
    'go',
    'lua',
    'python',
    'rust',
    'tsx',
    'javascript',
    'vimdoc',
    'vim',
    'bash',
    'svelte',
    'css',
    'vue',
    'python',
    'astro',
    'yaml',
    'prisma',
    'graphql',
  }

  local alreadyInstalled = require('nvim-treesitter.config').get_installed()
  local parsersToInstall = vim
    .iter(ensureInstalled)
    :filter(function(parser)
      return not vim.tbl_contains(alreadyInstalled, parser)
    end)
    :totable()
  require('nvim-treesitter').install(parsersToInstall)

  vim.defer_fn(function()
    require('nvim-treesitter').setup {
      auto_install = false,
      sync_install = false,
      ignore_install = {},
      modules = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        use_languagetree = false,
        disable = function(_, bufnr)
          local buf_name = vim.api.nvim_buf_get_name(bufnr)
          local file_size = vim.api.nvim_call_function('getfsize', { buf_name })
          return file_size > 256 * 1024
        end,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    }
  end, 0)

  -- Native LSP setup (no mason, no lspconfig)
  vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    root_markers = { '.git' },
  })

  vim.lsp.enable {
    'ts_ls',
    'lua_ls',
    'pyright',
    'cssls',
    'html',
    'tailwindcss',
    'svelte',
    'graphql',
    'emmet_ls',
    'prismals',
    'gopls',
    'rust_analyzer',
  }

  vim.diagnostic.config { virtual_text = false }
end

return modules
