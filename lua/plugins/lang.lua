-- vim:fileencoding=utf-8:foldmethod=marker
return {
	{
		"lervag/vimtex",
		ft = "tex",
		-- lazy = true,
		config = function()
			vim.g.vimtex_compiler_latexmk_engines = { _ = "-xelatex" }
			vim.g.vimtex_compiler_latexrun_engines = { _ = "xelatex" }
			vim.g.vimtex_compiler_progname = "nvr"
			vim.g.vimtex_continuous_preview = 1
			vim.g.vimtex_syntax_conceal_disable = 1
			vim.g.vimtex_syntax_nospell_comment = 1
			vim.g.vimtex_view_method = "zathura"
			-- require("nvim-treesitter.configs").setup ({
			--   highlight = { enable = true, disable = {"latex"}, },
			-- })
		end,
	},
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    cond = false,
    ft = { "tex", "markdown" },
    requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = function()
      require'luasnip-latex-snippets'.setup()
    end,
  },

	{
		"elkowar/yuck.vim",
		ft = "yuck",
	},
	{
		"Shirk/vim-gas",
		ft = "asm",
	},
	{
		"kaarmu/typst.vim",
		ft = "typst",
		keys = {
		},
	},
	{
		"h-hg/fcitx.nvim",
		event = "InsertEnter",
	},

  {
    "nvim-orgmode/orgmode",
    cond = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    config = function(_, opts)
      require("orgmode").setup (opts)
      require('orgmode').setup_ts_grammar()
      -- Treesitter configuration
      require('nvim-treesitter.configs').setup {
        -- If TS highlights are not enabled at all, or disabled via `disable` prop,
        -- highlighting will fallback to default Vim syntax highlighting
        highlight = {
          enable = true,
          -- Required for spellcheck, some LaTex highlights and
          -- code block highlights that do not have ts grammar
          additional_vim_regex_highlighting = {'org'},
        },
        ensure_installed = {'org'}, -- Or run :TSUpdate org
      }

      require('orgmode').setup({
        org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
        org_default_notes_file = '~/Dropbox/org/refile.org',
      })
    end
  },

	{
		"nvim-neorg/neorg",
    cmd = {"Neorg"},
    ft = {"norg"},
		dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-neorg/neorg-telescope" },
    },
		--{{{
		-- event = "BufEnter",
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
        ["core.integrations.telescope"] = {},
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
            workspaces = {
              notes = "~/notes",
            },
          },
				},
        ["core.export.markdown"] = {},
        ["core.summary"] = {},
        -- ["core.ui"] = {},
        -- ["core.ui.calendar"] = {},
			},
		},
    config = function (_, opts)
      require("neorg").setup(opts)
      local neorg_callbacks = require("neorg.callbacks")
      neorg_callbacks.on_event("core.keybinds.events.enable_keybinds",
        function(_, keybinds)
          keybinds.map_event_to_mode("norg",
            {
              -- n = { { "<C-s>", "core.integrations.telescope.find_linkable" }, },
              i = { { "<C-l>", "core.integrations.telescope.insert_link" }, },
            },
            { silent = true, noremap = true, }
          )
        end, nil -- content filter
      )
    end,
		--}}}
	},
}
