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
}
