-- TypeScript 7 moved the language server into the native compiler, and projects
-- that alias the `typescript` package to a slim build ship no `tsserver.js` for
-- typescript-language-server to load. Driving the project's own `tsc` shim keeps
-- the server version pinned to whatever the repo depends on.
return {
  cmd = function(dispatchers, config)
    local root = (config and config.root_dir) or vim.uv.cwd()
    -- Workspace packages in a pnpm monorepo often have no node_modules of their
    -- own, so walk up to the nearest one instead of falling back to a global tsc
    -- that may predate `--lsp`.
    local found = vim.fs.find('node_modules/.bin/tsc', { path = root, upward = true })[1]
    local exe = found or 'tsc'
    return vim.lsp.rpc.start({ exe, '--lsp', '-stdio' }, dispatchers)
  end,
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
}
