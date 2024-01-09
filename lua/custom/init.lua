require('custom.mappings')
require('custom.lazyvim')

local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- OCaml opam
vim.opt.rtp:append("~/.opam/default/share/ocp-indent/vim")

-- Colorscheme
vim.cmd.colorscheme 'tokyonight-night'

-- TODO-comments
vim.keymap.set("n", "<leader>tt", ":TodoTrouble<Cr>", { desc = "TODO open trouble" })

vim.keymap.set("n", "<leader>tn", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "<leader>tp", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {}
