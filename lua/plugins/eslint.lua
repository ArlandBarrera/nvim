return {
	"esmuellert/nvim-eslint",
	event = { "BufReadPost" },
	config = function()
		require("nvim-eslint").setup({})
	end,
}
