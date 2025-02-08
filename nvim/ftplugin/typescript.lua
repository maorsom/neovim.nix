local ts_lsp_cmd = 'typescript-language-server'

if vim.fn.executable(ts_lsp_cmd) ~= 1 then
  return
end

local root_files = {
  'package.json',
  'tsconfig.json',
  'jsconfig.json',
  'yarn.lock',
  'pnpm-lock.yaml',
  'package-lock.json',
}

vim.lsp.start {
  name = 'typescript',
  filetypes = { "typescript", "typescriptreact", "javascriptreact", "javascript" },
  cmd = {ts_lsp_cmd, '--stdio'},
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities()
}
