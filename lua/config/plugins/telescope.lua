return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local telescope_builtin = require('telescope.builtin')

    telescope.setup {

      theme = "ivy",
      pickers = {
        find_files = {
          theme = "ivy"
        }
      },
      extensions = {
        fzf = {}
      }
    }

    telescope.load_extension("fzf")

    vim.keymap.set("n", "<space>sf", telescope_builtin.find_files)
    vim.keymap.set("n", "<space>en", function()
      telescope_builtin.find_files {
        cwd = vim.fn.stdpath("config")
      }
    end
    )
    vim.keymap.set("n", "<space>sp", function()
      telescope_builtin.find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      }
    end
    )
    vim.keymap.set("n", "<space>ss", telescope_builtin.spell_suggest)
    vim.keymap.set("n", "<space>sb", telescope_builtin.buffers)
    vim.keymap.set("n", "<space>sh", telescope_builtin.help_tags)
    require "config.plugins.telescope.multigrep".setup()
    vim.keymap.set("n", "<space>sr", telescope_builtin.lsp_references)
  end

}
