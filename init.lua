vim.opt.number = true
vim.cmd('packadd packer.nvim')
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    require'nvim-treesitter.configs'.setup {
        ensure_installed = "c",
        highlight = {enable = true}
    }
    use 'morhetz/gruvbox'
    use 'christoomey/vim-tmux-navigator'
    use 'nvim-lualine/lualine.nvim'
    require('lualine').setup({
        options = {
            icons_enabled = false,
            theme = 'ayu_dark',
            component_separators = {left = '|', right = '|'},
            section_separators = {left = ' ', right = ' '}
        }
    })
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
end)
vim.opt.list = true
vim.opt.listchars:append("tab:▸ ")
vim.opt.expandtab = true
vim.cmd 'colorscheme gruvbox'
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.swapfile = false
-- Change the mapleader from \ to
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>fr', ':History<CR>', {noremap = true})
-- open another file in same dir as current file, Using keymaps from spacemacs
vim.api.nvim_set_keymap('n', '<leader>ff', ':e %:h/<C-d>', {noremap = true})
