if vim.g.did_load_telescope_plugin then
  return
end
vim.g.did_load_telescope_plugin = true
print("HELLLLOOOOOOOOOO")

local telescope = require("telescope")
local actions = require("telescope.actions")
local transform_mod = require("telescope.actions.mt").transform_mod

local trouble = require("trouble")
local trouble_telescope = require("trouble.sources.telescope")

-- or create your custom action
local custom_actions = transform_mod({
  open_trouble_qflist = function()
    trouble.toggle("qflist")
    trouble.focus()
  end,
})


local telescope_mapping = {
  ["<C-k>"] = actions.move_selection_previous, -- move to prev result
  ["<C-j>"] = actions.move_selection_next, -- move to next result
  ["<C-q>"] = actions.send_to_qflist + custom_actions.open_trouble_qflist,
  ["<C-t>"] = trouble_telescope.open,
}


telescope.setup({
  defaults = {
    path_display = { "smart" },
    mappings = {
      i = telescope_mapping,
      n = telescope_mapping,
    },
  },
})


telescope.load_extension("fzf")

-- set keymaps
local keymap = vim.keymap -- for conciseness
local builtin = require("telescope.builtin")


keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })

keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[S]earch [H]elp" })
keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
keymap.set("n", "<leader>fe", builtin.resume, { desc = "[S]earch R[e]sume" })
keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>sn", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })
