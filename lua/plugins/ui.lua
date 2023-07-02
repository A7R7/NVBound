-- vim:fileencoding=utf-8:foldmethod=marker

return {
	{
		"rcarriga/nvim-notify", -- Better `vim.notify()`
    event = "VeryLazy",
		-- {{{
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		opts = {
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 1000 })
      end,
			timeout = 2000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			top_down = false,
		},
    config = function(_, opts)
      local notify = require "notify"
      notify.setup(opts)
      vim.notify = notify
    end,
		-- }}}
	},

	{
		"stevearc/dressing.nvim", -- better vim.ui
		--{{{
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
		--}}}
	},

	{
		"lukas-reineke/indent-blankline.nvim", -- indent guide lines for Neovim
		--{{{
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			-- char = "▏",
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
		--}}}
	},

	{
		"echasnovski/mini.indentscope", -- active indent guide and indent text objects
		--{{{
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
		--}}}
	},

	-- noicer ui
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		cond = function()
			if vim.g.neovide then return false end
			return true
		end,
		--{{{
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
    -- stylua: ignore
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      -- { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
      -- { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
    },
		--}}}
	},

	-- dashboard
	{
		"goolord/alpha-nvim",
    --{{{
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
      -- dashboard.section.header.val = require("util.alpha_2").starbound_neovim.logo()
      -- dashboard.section.header.opts.hl = require("util.alpha_2").starbound_neovim.color()
			-- dashboard.section.header.val = vim.split(require("util.alpha").NeoV, "\n")
			-- dashboard.section.header.opts.hl = "AlphaHeader"
      -- dashboard.section.header = require("util.alpha_3").init()
			dashboard.section.buttons.val = {
				-- dashboard.button("f", "󰈞 " .. " - Find file", "<cmd>Telescope find_files <CR>"),
				dashboard.button("n", " " .. " - New file", "<cmd>ene <BAR> startinsert <CR>"),
				--     dashboard.button("g", "󰊄 " .. " - Find text", "<cmd>Telescope live_grep <CR>"),
        dashboard.button("r", " " .. " - Recent files", "<cmd> Telescope oldfiles <CR>"),
        dashboard.button("s", " " .. " - Restore Session", [[<cmd>lua require("persistence").load() <cr>]]),
				dashboard.button("z", "󰰶 " .. " - Zoxide", [[<cmd>lua require("telescope").extensions.zoxide.list()<cr>]]),
				dashboard.button("t", " " .. " - Terminal", "<cmd>terminal<cr>"),
				dashboard.button("c", " " .. " - Config", "<cmd>exe 'tcd' .stdpath('config')<cr>"),
				dashboard.button("p", " " .. " - Packages", "<cmd>Lazy<CR>"),
				dashboard.button("q", "󰅖 " .. " - Quit", "<cmd>qa<CR>"),
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end
			dashboard.section.footer.opts.hl = "Type"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout = {
        { type = "padding", val = 3 },
        require("util.alpha_3").init(),
        { type = "padding", val = 3 },
        dashboard.section.buttons,
        dashboard.section.footer,
      }
			return dashboard
		end,

		config = function(_, dashboard)
			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "AlphaReady",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			require("alpha").setup(dashboard.opts)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
		--}}}
	},

	-- lsp symbol navigation for lualine
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		--{{{
		init = function()
			vim.g.navic_silence = true
			require("util").on_attach(function(client, buffer)
				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, buffer)
				end
			end)
		end,
		opts = function()
			return {
				separator = " ",
				highlight = true,
				depth_limit = 5,
				icons = require("util.icons").kinds,
			}
		end,
		--}}}
	},

	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },

	{
		"anuvyklack/pretty-fold.nvim",
		--{{{
		config = function(_, opts)
			require("pretty-fold").setup(opts)
		end,
		--}}}
	},

	{
		"dstein64/nvim-scrollview",
    cond = false,
    event = "VeryLazy",
		--{{{
		opts = {
			excluded_filetypes = { "nerdtree" },
			current_only = true,
			winblend = 75,
			base = "buffer",
			column = 80,
		},
		--}}}
	},

  { 'Bekaboo/dropbar.nvim' }
}
