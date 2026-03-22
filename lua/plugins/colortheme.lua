-- ================================================================================================
-- TITLE : colorscheme + NvChad UI extras
-- ABOUT : NvChad's base46 theme engine (68 built-in themes) + live theme picker + cheatsheet
-- PICKER    : <Space>th  →  opens the base46 theme switcher
-- CHEATSHEET: <Space>ch  →  opens the NvChad cheatsheet
-- CHANGE DEFAULT: edit M.base46.theme in lua/nvconfig.lua
-- ================================================================================================

return {
  'nvim-lua/plenary.nvim',
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  {
    'nvchad/ui',
    config = function()
      require 'nvchad'
    end,
  },
  {
    'nvchad/base46',
    lazy = true,
    build = function()
      require('base46').load_all_highlights()
    end,
  },
  { 'nvchad/volt', lazy = true },
}
