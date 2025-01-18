local python_lsp_cmd = 'pylsp'

if vim.fn.executable(python_lsp_cmd) ~= 1 then
  return
end

local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
}

vim.lsp.start {
  name = 'pylsp',
  cmd = {python_lsp_cmd},
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities()
}
