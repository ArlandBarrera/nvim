vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('edit_text', { clear = true }),
  pattern = { 'gitvommit', 'markdown', 'txt' },
  desc = 'Enable spell cheking and text wrapping for certain filetypes',
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
