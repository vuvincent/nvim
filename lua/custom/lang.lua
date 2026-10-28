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
    'astro',
    'yaml',
    'prisma',
    'graphql',
    'hcl',
    'terraform',
  }

  local alreadyInstalled = require('nvim-treesitter.config').get_installed()
  local parsersToInstall = vim
    .iter(ensureInstalled)
    :filter(function(parser)
      return not vim.tbl_contains(alreadyInstalled, parser)
    end)
    :totable()
  require('nvim-treesitter').install(parsersToInstall)

  -- nvim-treesitter main branch dropped the old module API; enable highlighting via autocmd
  vim.api.nvim_create_autocmd('FileType', {
    callback = function(ev)
      local buf_name = vim.api.nvim_buf_get_name(ev.buf)
      local file_size = vim.api.nvim_call_function('getfsize', { buf_name })
      if file_size <= 256 * 1024 then
        pcall(vim.treesitter.start, ev.buf)
      end
    end,
  })

  -- Native LSP setup (no mason, no lspconfig)
  vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    root_markers = { '.git' },
  })

  vim.lsp.enable {
    -- 'ts_ls' cannot start where `typescript` is aliased to a build without
    -- tsserver.js; 'tsgo' talks to TypeScript 7's native server instead.
    'tsgo',
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
    'clangd',
    'terraformls',
  }

  vim.diagnostic.config { virtual_text = false }
end

return modules
