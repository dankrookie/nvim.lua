vim.opt.number = true
vim.cmd([[packadd packer.nvim]])
require("packer").startup(function()
  use("wbthomason/packer.nvim")
  use("morhetz/gruvbox")
  vim.cmd([[
    colorscheme gruvbox
    autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
  ]])
  use("nvim-treesitter/nvim-treesitter")
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "rust" },
    highlight = {
      enable = false,
    },
  })
  use("nvim-lualine/lualine.nvim")
  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = "ayu_dark",
    },
  })
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  require("telescope").setup({
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        additional_args = function(opts)
          return { "--hidden" }
        end,
      },
    },
  })
  use("christoomey/vim-tmux-navigator")
end)
vim.opt.list = true
vim.opt.listchars:append("tab:> ")
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.swapfile = false
vim.opt.wrap = false
-- Map global leader from \ to Space
vim.g.mapleader = " "
-- Persist undo tree across neovim sessions
vim.opt.undofile = true

local builtin = require("telescope.builtin")
-- Find File(ff): Open another file in same dir as current file,
vim.keymap.set("n", "<leader>ff", function()
  opts = {
    search_dirs = { vim.fn.expand("%:h") },
    find_command = { "fd", "--max-depth", "1" },
  }
  builtin.find_files(opts)
end, {})
-- Project Find(pf): Open another file from project (git/hg repository)
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
-- Find Recent(fr): Open recently used files
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
-- Grep in files
vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
