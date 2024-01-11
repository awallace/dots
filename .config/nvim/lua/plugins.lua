vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'wincent/command-t',
    run = 'cd lua/wincent/commandt/lib && make',
    setup = function ()
      vim.g.CommandTPreferredImplementation = 'lua'
    end,
    config = function()
      require('wincent.commandt').setup({
      })
    end,
  }

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use { 'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use { 'neoclide/coc.nvim', branch = 'release' }

  use {'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,

    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true },
        highlight = true,
        auto_install = true,
        sync_install = true,
        ensure_installed = { "java", "typescript", "javascript", "json", "html", "tsx" }
      })
    end
  }

end)

