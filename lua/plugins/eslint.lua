return {
	"esmuellert/nvim-eslint",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("nvim-eslint").setup({
			auto_fix_on_save = true,
		})
	end,
}
