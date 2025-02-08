if vim.g.did_load_formatter_plugin then
  return
end
vim.g.did_load_formatter_plugin = true

require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescript = {

      require("formatter.filetypes.typescript").prettier
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    }
  }
}
