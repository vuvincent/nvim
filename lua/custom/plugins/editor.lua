return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },
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
          width = 80
        },
      }
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

      local starter = require 'mini.starter'
      starter.setup {
        -- evaluate_single = true,
        items = {
          starter.sections.telescope(),
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
  {
    'nvim-pack/nvim-spectre',
  },
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads" },
        auto_session_use_git_branch = true
      }
    end
  },
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   config = function()
  --     require("supermaven-nvim").setup({})
  --   end,
  -- },
  {
    "tpope/vim-dadbod",
  },
  { "kristijanhusak/vim-dadbod-completion" },
  { "kristijanhusak/vim-dadbod-ui" },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup {}
    end
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    'rhysd/conflict-marker.vim'
  },
  {
    'levouh/tint.nvim',
    config = function()
      require('tint').setup({
        tint = -60
      })
    end
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },

  {
    'ruifm/gitlinker.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require "gitlinker".setup({
        opts = {
          remote = nil, -- force the use of a specific remote
          -- adds current line nr in the url for normal mode
          add_current_line_on_normal_mode = true,
          -- callback for what to do with the url
          action_callback = require "gitlinker.actions".copy_to_clipboard,
          -- print the url after performing the action
          print_url = true,
        },
        callbacks = {
          ["github.com"] = require "gitlinker.hosts".get_github_type_url,
          ["gitlab.com"] = require "gitlinker.hosts".get_gitlab_type_url,
          ["try.gitea.io"] = require "gitlinker.hosts".get_gitea_type_url,
          ["codeberg.org"] = require "gitlinker.hosts".get_gitea_type_url,
          ["bitbucket.org"] = require "gitlinker.hosts".get_bitbucket_type_url,
          ["try.gogs.io"] = require "gitlinker.hosts".get_gogs_type_url,
          ["git.sr.ht"] = require "gitlinker.hosts".get_srht_type_url,
          ["git.launchpad.net"] = require "gitlinker.hosts".get_launchpad_type_url,
          ["repo.or.cz"] = require "gitlinker.hosts".get_repoorcz_type_url,
          ["git.kernel.org"] = require "gitlinker.hosts".get_cgit_type_url,
          ["git.savannah.gnu.org"] = require "gitlinker.hosts".get_cgit_type_url
        },
      })
    end
  },

  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.bufremove').setup()
    end
  },
}
