-- vim:fileencoding=utf-8:foldmethod=marker
local use_heirline = false
return {

	{
		"akinsho/bufferline.nvim", -- bufferline
    cond = not use_heirline,
		--{{{
		event = "VeryLazy",
		opts = {
			options = {
				-- hover = { enabled = true, delay = 200, reveal = { "close" } },
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				diagnostics_indicator = function(_, _, diag)
					local icons = require("util.icons").diagnostics
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						highlight = "Directory",
						-- text = "Neo-tree",
						-- text_align = "left",
					},
				},
			},
		},
		--}}}
	},

	{
		"nvim-lualine/lualine.nvim", -- statusline
    cond = not use_heirline,
		--{{{
		event = "VeryLazy",
		opts = function(plugin)
			local icons = require("util.icons")

			local function fg(name)
				return function()
					---@type {foreground?:number}?
					local hl = vim.api.nvim_get_hl_by_name(name, true)
					return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
				end
			end

			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{ "mode", icons_enabled = true, icon = "" },
					},
					lualine_b = { "branch" },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            -- stylua: ignore
            {
              function() return require("nvim-navic").get_location() end,
              cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            },
					},
					lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = fg("Statement")
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = fg("Constant") ,
            },
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							color = fg("Special"),
						},
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
					},
					lualine_y = {
						{ "progress", separator = "", padding = { left = 1, right = 1 }, icon = { "" } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return os.date("%R")
						end,
					},
				},
				extensions = { "neo-tree" },
			}
		end,
		--}}}
	},

	{
		"rebelot/heirline.nvim",
		cond = use_heirline,
		event = "BufEnter",
		opts = function()
			return {
				opts = {
				-- 	disable_winbar_cb = function(args)
				-- 		return status.condition.buffer_matches({
				-- 			buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
				-- 			filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
				-- 		}, args.buf)
				-- 	end,
				},
				statusline = { -- statusline
				-- 	hl = { fg = "fg", bg = "bg" },
				-- 	status.component.mode(),
				-- 	status.component.git_branch(),
				-- 	status.component.file_info { filetype = {}, filename = false, file_modified = false },
				-- 	status.component.git_diff(),
				-- 	status.component.diagnostics(),
				-- 	status.component.fill(),
				-- 	status.component.cmd_info(),
				-- 	status.component.fill(),
				-- 	status.component.lsp(),
				-- 	status.component.treesitter(),
				-- 	status.component.nav(),
				-- 	status.component.mode { surround = { separator = "right" } },
				},
				winbar = { -- winbar
				-- 	init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
				-- 	fallthrough = false,
				-- 	{
				-- 		condition = function() return not status.condition.is_active() end,
				-- 		status.component.separated_path(),
				-- 		status.component.file_info {
				-- 			file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
				-- 			file_modified = false,
				-- 			file_read_only = false,
				-- 			hl = status.hl.get_attributes("winbarnc", true),
				-- 			surround = false,
				-- 			update = "BufEnter",
				-- 		},
				-- 	},
				-- 	status.component.breadcrumbs { hl = status.hl.get_attributes("winbar", true) },
				},
				tabline = { -- bufferline
					{ -- file tree padding
					-- 	condition = function(self)
					-- 		self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
					-- 		return status.condition.buffer_matches(
					-- 			{ filetype = { "aerial", "dapui_.", "neo%-tree", "NvimTree" } },
					-- 			vim.api.nvim_win_get_buf(self.winid)
					-- 		)
					-- 	end,
					-- 	provider = function(self) return string.rep(" ", vim.api.nvim_win_get_width(self.winid) + 1) end,
					-- 	hl = { bg = "tabline_bg" },
					},
					-- status.heirline.make_buflist(status.component.tabline_file_info()), -- component for each buffer tab
					-- status.component.fill { hl = { bg = "tabline_bg" } }, -- fill the rest of the tabline with background color

					{ -- tab list
						condition = function() return #vim.api.nvim_list_tabpages() >= 2 end, -- only show tabs if there are more than one
						require("heirline.utils").make_tablist { -- component for each tab
							provider = function(self) return (self and self.tabnr) and "%" .. self.tabnr .. "T " .. self.tabnr .. " %T" or "" end
							-- hl = function(self) return status.hl.get_attributes(status.heirline.tab_type(self, "tab"), true) end,
						},
						{ -- close button for current tab
						-- 	provider = status.provider.close_button { kind = "TabClose", padding = { left = 1, right = 1 } },
						-- 	hl = status.hl.get_attributes("tab_close", true),
						-- 	on_click = {
						-- 		callback = function() require("astronvim.utils.buffer").close_tab() end,
						-- 		name = "heirline_tabline_close_tab_callback",
						-- 	},
						},
					},
				},
				-- statuscolumn = vim.fn.has "nvim-0.9" == 1 and {
				-- 	status.component.foldcolumn(),
				-- 	status.component.fill(),
				-- 	status.component.numbercolumn(),
				-- 	status.component.signcolumn(),
				-- } or nil,
			}
		end,
		config = function (_, opts)
      require ("heirline").setup(opts)
    end,
	}
}
