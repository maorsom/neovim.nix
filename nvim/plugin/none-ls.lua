if vim.g.did_load_nonels_plugin then
  return
end
vim.g.did_load_nonels_plugin = true

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.nixfmt,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint
  }
})

vim.keymap.set('n', '<leader>gf',vim.lsp.buf.format,{})
