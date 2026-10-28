return {
  cmd = { 'typescript-language-server', '--stdio' },
  cmd_env = { NODE_OPTIONS = '--max-old-space-size=12288' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
}
