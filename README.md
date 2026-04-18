My personal Neovim config templated from kickstart.nvim

This is fairly minimal. No file explorer (I use a terminal file navigator) + no buffer management because I use tabs (it's actually much better than a bunch of buffers that urges you to tab through them because they would be at the top of your editor) + no startify stuff. Just telescope + a common set of extensions that works.

## Setup

### LSP Servers

LSP servers must be installed on `$PATH` — Mason is not used.

```bash
# TypeScript, HTML, CSS, JSON, ESLint
npm install -g typescript-language-server typescript
npm install -g vscode-langservers-extracted

# Frontend
npm install -g @tailwindcss/language-server
npm install -g svelte-language-server
npm install -g emmet-ls

# Other
npm install -g graphql-language-service-cli
npm install -g @prisma/language-server
npm install -g pyright

# Lua
brew install lua-language-server

# Go and Rust (via their toolchains)
go install golang.org/x/tools/gopls@latest
rustup component add rust-analyzer
```

### Formatters

```bash
npm install -g prettier
pip install black isort
brew install stylua
# rustfmt and goimports come with rustup/go
```
