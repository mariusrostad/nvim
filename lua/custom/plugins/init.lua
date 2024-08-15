-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Jump panel left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Jump panel down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Jump panel up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Jump panel right' })

vim.keymap.set('n', '<C-e>', '<Cmd>Neotree toggle<CR>', { desc = 'Neotree toggle' })
vim.keymap.set('n', '<C-s>', '<Cmd>write<CR>', { desc = 'Save' })

-- Trouble settings
vim.keymap.set('n', '<leader>xx', function()
  require('trouble').toggle()
end, { desc = 'Trouble toggle' })
vim.keymap.set('n', '<leader>xw', function()
  require('trouble').toggle 'workspace_diagnostics'
end, { desc = 'Trouble workspace_diagnostics' })
vim.keymap.set('n', '<leader>xd', function()
  require('trouble').toggle 'document_diagnostics'
end, { desc = 'Trouble document_diagnostics' })
vim.keymap.set('n', '<leader>xq', function()
  require('trouble').toggle 'quickfix'
end, { desc = 'Trouble quickfix' })
vim.keymap.set('n', '<leader>xl', function()
  require('trouble').toggle 'loclist'
end, { desc = 'Trouble loclist' })
vim.keymap.set('n', 'gR', function()
  require('trouble').toggle 'lsp_references'
end, { desc = 'Trouble lsp_references' })

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.scrolloff = 15

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  {
    'grafana/jsonnet-language-server',
  },
  {
    'github/copilot.vim',
  },
  {
    'windwp/nvim-autopairs',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    {
      'akinsho/toggleterm.nvim',
      version = 'v2.8.0',
      config = function()
        require('toggleterm').setup {}
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new {
          cmd = 'lazygit',
          hidden = true,
          direction = 'float',
          float_opts = {
            boarder = 'double',
          },
        }

        vim.keymap.set('n', '<leader>gg', function()
          lazygit:toggle()
        end, { desc = 'Trouble toggle' })
      end,
    },
  },
}
