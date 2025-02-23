local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
-- local inoremap = require("user.keymap_utils").inoremap
local tnoremap = require("user.keymap_utils").tnoremap
local xnoremap = require("user.keymap_utils").xnoremap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
local utils = require("user.utils")

local M = {}

-- Normal --
-- Disable Space bar since it'll be used as the leader key
nnoremap("<space>", "<nop>")

-- Window navigation
nnoremap("<C-h>", "<C-w><C-h>")
nnoremap("<C-j>", "<C-w><C-j>")
nnoremap("<C-k>", "<C-w><C-k>")
nnoremap("<C-l>", "<C-w><C-l>")

-- [P]ython [R]un
nnoremap("<leader>pr", "<cmd>split | term python3 %<cr>", { desc = "[P]ython [R]un file in new terminal" })

-- Swap between last two buffers
nnoremap("<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- Save with leader key
nnoremap("<leader>w", "<cmd>w<cr>", { silent = false })

-- Quit with leader key
nnoremap("<leader>q", "<cmd>q<cr>", { silent = false })

-- Save and Quit with leader key
nnoremap("<leader>z", "<cmd>wq<cr>", { silent = false })

-- Map Oil to <leader>e
nnoremap("<leader>e", function()
	require("oil").toggle_float()
end)

-- Center buffer while navigating --
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("g", "gzz")
nnoremap("gg", "ggzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")

-- Press [S] for quick find/replace for the word under the cursor
nnoremap("S", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Open [S]pectre for global find/replace
nnoremap("<leader>S", function()
	require("spectre").toggle()
end)

-- Press [U] for redo
nnoremap("U", "<cmd>redo<cr>")

-- [N][O] / Turn off highlighted results
nnoremap("<leader>no", "<cmd>noh<cr>")

-- Diagnostics --
-- [D]iagnostics [E]nable
nnoremap("<leader>de", function()
	vim.diagnostic.config({ virtual_text = true })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto ]Next [D]iagnostic of any severity
nnoremap("]d", function()
	vim.diagnostic.goto_next({})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto [Previous [D]iagnostic of any severity
nnoremap("[d", function()
	vim.diagnostic.goto_prev({})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto ]Next [E]rror diagnostic
nnoremap("]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto [Previous [E]rror diagnostic
nnoremap("[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto ]Next [W]arning diagnostic
nnoremap("]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto [Previous [W]arning diagnostic
nnoremap("[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Quickfix list diagnostics --
-- [L]ist [D]iagnostics in a Quickfix list (qflist)
nnoremap("<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix [L]ist [D]iagnostics" })

-- [C]ommand [N]ext qflist item
nnoremap("<leader>cn", ":cnext<cr>zz")

-- [C]ommand [P]revious qflist item
nnoremap("<leader>cp", ":cprevious<cr>zz")

-- [C]ommand [O]pen qflist
nnoremap("<leader>co", ":copen<cr>zz")

-- [C]ommand [C]lose qflist
nnoremap("<leader>cc", ":cclose<cr>zz")

-- [M]aximiizerToggle (szw/vim-maximizer)
nnoremap("<leader>m", ":MaximizerToggle<cr>")

-- Rezise split windows to be [=] / equal size
nnoremap("<leader>=", "<C-w>=")

-- [F]ormat
nnoremap("<leader>f", ":Format<cr>")

-- [R]otate open [W]indows
nnoremap("<leader>rw", ":RotateWindows<cr>", { desc = "[R]otate [W]indows" })

-- [G][X] open link under cursor
nnoremap("gx", ":sil !open <cWORD><cr>", { silent = true })

-- Harpoon --
-- [H]arpoon [O]pen UI
nnoremap("<leader>ho", function()
	harpoon_ui.toggle_quick_menu()
end)

-- [H]arpoon [A]dd current file
nnoremap("<leader>ha", function()
	harpoon_mark.add_file()
end)

-- [H]arpoon [R]emove current file
nnoremap("<leader>hr", function()
	harpoon_mark.rm_file()
end)

-- [H]arpoon [C]lear all files
nnoremap("<leader>hc", function()
	harpoon_mark.clear_all()
end)

-- Quickly jump to harpooned files 1-5

nnoremap("<leader>1", function()
	harpoon_ui.nav_file(1)
end)

nnoremap("<leader>2", function()
	harpoon_ui.nav_file(2)
end)
nnoremap("<leader>3", function()
	harpoon_ui.nav_file(3)
end)
nnoremap("<leader>4", function()
	harpoon_ui.nav_file(4)
end)
nnoremap("<leader>5", function()
	harpoon_ui.nav_file(5)
end)

-- Git --
-- [G]it [B]lame
nnoremap("<leader>gb", ":Gitsigns toggle_current_line_blame<cr>")

-- [G]it [F]iles
nnoremap("<leader>gf", function()
	local cmd = {
		"sort",
		"-u",
		"<(git diff --name-only --cached)",
		"<(git diff --name-only)",
		"<(git diff --name-only --diff-filter=U)",
	}

	if not utils.is_git_directory() then
		vim.notify(
			"Current project is not a git directory",
			vim.log.levels.WARN,
			{ title = "Telescope Git Files", git_command = cmd }
		)
	else
		require("telescope.builtin").git_files()
	end
end, { desc = "Search [G]it [F]iles" })

-- Telescope --
nnoremap("<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })

nnoremap("<leader>sb", require("telescope.builtin").buffers, { desc = "[S]earch Open [B]uffers" })

nnoremap("<leader>sf", function()
	require("telescope.builtin").find_files({ hidden = true })
end, { desc = "[S]earch [F]iles" })

nnoremap("<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })

nnoremap("<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })

nnoremap("<leader>sc", function()
	require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[S]earch [C]ommands" })

nnoremap("<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

nnoremap("<leader>ss", function()
	require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[S]search [S]pelling suggestions" })

-- LSP Keybinds (exports a function to be used in ../../after/plugin/lsp.lua b/c we need a reference to the current buffer) --
M.map_lsp_keybinds = function(buffer_number)
	nnoremap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })

	nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

	nnoremap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })

	-- Telescope LSP --
	nnoremap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
	)

	nnoremap(
		"gi",
		require("telescope.builtin").lsp_implementations,
		{ desc = "LSP: [G]oto [I]mplementation", buffer = buffer_number }
	)

	nnoremap(
		"<leader>bs",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [B]uffer [S]ymbols", buffer = buffer_number }
	)

	nnoremap(
		"<leader>ps",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: [P]roject [S]ymbols", buffer = buffer_number }
	)

	-- Documentation `:help K` --
	nnoremap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })

	nnoremap("<leader>k", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

	-- Lesser used LSP functionality --
	nnoremap("gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration", buffer = buffer_number })

	nnoremap("td", vim.lsp.buf.type_definition, { desc = "LSP: [T]ype [D]definition", buffer = buffer_number })
end

-- [S]ymbol [O]utline keybind
nnoremap("<leader>so", ":SymbolsOutline<cr>")

-- nvim-ufo --
-- 'zr', hierarchical open folds
-- 'zm', hierarchical close folds
nnoremap("zR", require("ufo").openAllFolds)
nnoremap("zM", require("ufo").closeAllFolds)

-- Visual --
-- Diabble Space bar since it'll be used as the leader key
vnoremap("<space>", "<nop>")

-- Paste without losing the contents of the register
xnoremap("<leader>p", '"_dP"')

-- Move selected text up/down in visual mode
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

-- Reselected the lsat visual selection
xnoremap("<<", function()
	vim.cmd("normal! <<")
	vim.cmd("normal! gv")
end)

xnoremap(">>", function()
	vim.cmd("normal! >>")
	vim.cmd("normal! gv")
end)

-- Terminal --
-- Enter normal mode while in terminal
tnoremap("<esc>", [[<C-\><C-n>]])

-- Window navigation from terminal
tnoremap("<C-h>", [[<Cmd>wincmd h<CR>]])
tnoremap("<C-j>", [[<Cmd>wincmd j<CR>]])
tnoremap("<C-k>", [[<Cmd>wincmd k<CR>]])
tnoremap("<C-l>", [[<Cmd>wincmd l<CR>]])

-- Reenable default <space> functionality to prevent input delay
tnoremap("<space>", "<space>")

return M
