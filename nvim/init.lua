-- General Settings
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

vim.bo.autoindent = true
vim.bo.smartindent = true

vim.opt.number = true
vim.opt.undofile = true
-- vim.wo.realtivenumer = true

vim.cmd [[colorscheme gruvbox]]
-- Keymappings

local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    { noremap = true, silent = true }
  )
end
-- EXample.  key_mapper('v', 'jK', '<ESC>')


-- Plugins + Packer install
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = '~/.local/share/nvim/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  update_in_insert = true,
}
)

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'xiyaowong/nvim-transparent'
  use { 'neoclide/coc.nvim', branch = 'release', run = "yarn install" }
  use "ellisonleao/gruvbox.nvim"
  use "jeffkreeftmeijer/vim-numbertoggle"
  use "lukas-reineke/indent-blankline.nvim"
  use { "Shatur/neovim-session-manager", requires = "nvim-lua/plenary.nvim" }
  --  use "mfussenegger/nvim-lint"
  use "sheerun/vim-polyglot"
end)
