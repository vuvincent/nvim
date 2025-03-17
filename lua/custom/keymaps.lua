-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>S', function() require("spectre").toggle() end, {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', function() require("spectre").open_visual({ select_word = true }) end, {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', function() require("spectre").open_file_search({ select_word = true }) end, {
    desc = "Search on current file"
})

vim.keymap.set('n', '<Tab>', '<cmd>bn<CR>')
vim.keymap.set('n', '<S-Tab>', '<cmd>bp<CR>')
vim.keymap.set('n', '<leader>x', require('mini.bufremove').delete, { desc = '[D]elete buffer' })

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
vim.g.omni_sql_no_default_maps = 1

vim.keymap.set('n', '<C-p>', require('telescope.builtin').builtin, { desc = 'Smart picker' })
vim.keymap.set('n', '<leader>sf', require('fzf-lua').files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>so', require('fzf-lua').oldfiles, { desc = '[S]earch [O]ldfiles' })
vim.keymap.set('n', '<leader><space>', require('fzf-lua').buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>sg', require('fzf-lua').live_grep, { desc = '[S]earch [G]rep' })
vim.keymap.set('n', '<leader>ws', require('fzf-lua').lsp_live_workspace_symbols, { desc = 'LSP [W]orkspace [S]ymbols' })
vim.keymap.set('n', '<leader>ds', require('fzf-lua').lsp_document_symbols, { desc = 'LSP [D]ocument [S]ymbols' })
vim.keymap.set('n', '<leader>sr', require('fzf-lua').resume, { desc = '[R]esume' })
vim.keymap.set('n', '<leader>dd', require('fzf-lua').diagnostics_document, { desc = 'Search [D]ocument [D]iagnostics' })
vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, { desc = '[F]or[m]at current buffer with LSP' })

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: [R]e[n]ame' })
vim.keymap.set('n', '<leader>ca', require('fzf-lua').lsp_code_actions, { desc = 'LSP: [C]ode [A]ction' })
vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = 'LSP: [G]oto [D]efinition' })
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'LSP: [G]oto [R]eferences' })

-- See `:help K` for why this keymap
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover Documentation' })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

vim.keymap.set('n', '<C-n>', require('nvim-tree.api').tree.toggle, { silent = true })

vim.api.nvim_set_keymap('n', '<leader>gy',
    '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".copy_to_clipboard})<cr>',
    { silent = true, desc = 'Copy Git permalink line to clipboard' })
vim.api.nvim_set_keymap('v', '<leader>gy',
    '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".copy_to_clipboard})<cr>',
    { desc = 'Copy Git permalink range to clipboard' })

-- set the keymaps for switching windows
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { silent = true })

-- Avanta (AI)
vim.keymap.set('v', '<leader>aa', require('avante.api').ask, { desc = '[A]vante [A]sk' })
vim.keymap.set('v', '<leader>ae', require('avante.api').edit, { desc = '[A]vante [e]dit' })
