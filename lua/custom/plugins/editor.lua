return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  -- {
  --   -- Add indentation guides even on blank lines
  --   'lukas-reineke/indent-blankline.nvim',
  --   -- Enable `lukas-reineke/indent-blankline.nvim`
  --   -- See `:help ibl`
  --   main = 'ibl',
  --   opts = {},
  -- },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      local gwidth = vim.api.nvim_list_uis()[1].width
      local gheight = vim.api.nvim_list_uis()[1].height
      local width = 100
      local height = 40

      require('nvim-tree').setup {
        disable_netrw = true,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = true,
        update_focused_file = {
          enable = true,
          update_root = false,
          ignore_list = {},
        },
        view = {
          centralize_selection = true,
          side = 'right',
          float = {
            enable = true,
            open_win_config = {
              relative = 'editor',
              width = width,
              height = height,
              row = (gheight - height) * 0.4,
              col = (gwidth - width) * 0.5,
            },
          },
        },
      }

      vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
      vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>', { silent = true })
    end,
  },
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      local header_art = [[
     ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
     │││├┤ │ │╰┐┌╯││││
     ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
        ]]

      -- using the mini plugins
      require('mini.sessions').setup {
        -- Whether to read latest session if Neovim opened without file arguments
        autoread = false,
        -- Whether to write current session before quitting Neovim
        autowrite = true,
        -- Directory where global sessions are stored (use `''` to disable)
        directory = '~/.vim/sessions', --<"session" subdir of user data directory from |stdpath()|>,
        -- File for local session (use `''` to disable)
        file = '', -- 'Session.vim',
      }

      local starter = require 'mini.starter'
      starter.setup {
        -- evaluate_single = true,
        items = {
          starter.sections.telescope(),
          starter.sections.sessions(77, true),
          starter.sections.builtin_actions(),
          starter.sections.recent_files(10, true),
          starter.sections.recent_files(10, false),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet '» ',
          starter.gen_hook.aligning('center', 'center'),
        },
        header = header_art,
        footer = '',
      }
    end,
  },

  -- {
  --   'Shatur/neovim-session-manager',
  --   config = function()
  --     local Path = require 'plenary.path'
  --     local config = require 'session_manager.config'
  --     require('session_manager').setup {
  --       sessions_dir = Path:new(vim.fn.stdpath 'data', 'sessions'), -- The directory where the session files will be saved.
  --       autoload_mode = config.AutoloadMode.LastSession,            -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  --       -- autosave_last_session = false,                               -- Automatically save last session on exit and on session switch.
  --       autosave_ignore_not_normal = true,                          -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  --       autosave_ignore_dirs = {},                                  -- A list of directories where the session will not be autosaved.
  --       autosave_ignore_filetypes = {                               -- All buffers of these file types will be closed before the session is saved.
  --         'gitcommit',
  --         'gitrebase',
  --       },
  --       autosave_ignore_buftypes = {},    -- All buffers of these bufer types will be closed before the session is saved.
  --       autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  --       max_path_length = 80,             -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
  --     }
  --   end,
  -- },
  --
}
