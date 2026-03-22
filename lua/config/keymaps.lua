-- ================================================================================================
-- TITLE: keymaps.lua
-- ABOUT: NvChad-style keybinds adapted for normie-nvim
-- ================================================================================================

local map = vim.keymap.set

-- ── General ─────────────────────────────────────────────────────────────────
map('i', 'jk', '<ESC>', { desc = 'Escape insert mode' })
map('n', ';', ':', { desc = 'Command mode' })
map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'Clear search highlights' })

-- ── Save / Quit ──────────────────────────────────────────────────────────────
map({ 'n', 'i' }, '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })

-- ── Clipboard ────────────────────────────────────────────────────────────────
map({ 'n', 'v' }, '<C-c>', '"+y', { desc = 'Copy to system clipboard' })
map('n', '<C-v>', '"+p', { desc = 'Paste from system clipboard' })
map('v', 'p', '"_dP', { desc = 'Paste without yanking selection', noremap = true, silent = true })

-- ── Window navigation ────────────────────────────────────────────────────────
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- ── Window resizing ──────────────────────────────────────────────────────────
map('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- ── Splits ───────────────────────────────────────────────────────────────────
map('n', '<leader>sv', '<cmd>vsplit<CR>', { desc = 'Split vertically' })
map('n', '<leader>sh', '<cmd>split<CR>', { desc = 'Split horizontally' })
map('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
map('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- ── Buffers ──────────────────────────────────────────────────────────────────
map('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Prev buffer' })
map('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Close buffer' })

-- ── Tabs ─────────────────────────────────────────────────────────────────────
map('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
map('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close tab' })
map('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Next tab' })
map('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Prev tab' })

-- ── Scrolling (centered) ─────────────────────────────────────────────────────
map('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })
map('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
map('n', 'N', 'Nzzzv', { desc = 'Prev search result (centered)' })

-- ── Indenting ────────────────────────────────────────────────────────────────
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '>', '>gv', { desc = 'Indent right' })

-- Delete without yanking to clipboard
map('n', 'd', '"_d', { desc = 'Delete without yanking' })
map('n', 'dd', '"_dd', { desc = 'Delete line without yanking' })
map('n', 'x', '"_x', { desc = 'Delete char without yanking' })
map('v', 'd', '"_d', { desc = 'Delete without yanking' })

-- ── Line operations ──────────────────────────────────────────────────────────
map('n', 'J', 'mzJ`z', { desc = 'Join lines (keep cursor)' })

-- ── Explorer (Snacks) ────────────────────────────────────────────────────────
map('n', '<leader>e', '<cmd>lua Snacks.explorer.open()<CR>', { desc = 'File explorer' })

-- ── Snacks picker (replaces Telescope) ──────────────────────────────────────
map('n', '<leader>ff', '<cmd>lua Snacks.picker.files()<CR>', { desc = 'Find files' })
map('n', '<leader>fw', '<cmd>lua Snacks.picker.grep()<CR>', { desc = 'Live grep' })
map('n', '<leader>fb', '<cmd>lua Snacks.picker.buffers()<CR>', { desc = 'Find buffers' })
map('n', '<leader>fh', '<cmd>lua Snacks.picker.help()<CR>', { desc = 'Find help' })
map('n', '<leader>fo', '<cmd>lua Snacks.picker.recent()<CR>', { desc = 'Recent files' })
map('n', '<leader>fc', '<cmd>lua Snacks.picker.grep_word()<CR>', { desc = 'Grep word under cursor' })
map('n', '<leader>fg', '<cmd>lua Snacks.picker.git_files()<CR>', { desc = 'Git files' })
map('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = 'Find TODOs' })
map('n', '<leader><leader>', '<cmd>lua Snacks.picker.files()<CR>', { desc = 'Find files' })

-- ── LSP ──────────────────────────────────────────────────────────────────────
map('n', 'gd', '<cmd>lua Snacks.picker.lsp_definitions()<CR>', { desc = 'Go to definition' })
map('n', 'gr', '<cmd>lua Snacks.picker.lsp_references()<CR>', { desc = 'Go to references' })
map('n', 'gi', '<cmd>lua Snacks.picker.lsp_implementations()<CR>', { desc = 'Go to implementations' })
map('n', 'gt', '<cmd>lua Snacks.picker.lsp_type_definitions()<CR>', { desc = 'Go to type definition' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover docs' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
map('n', '<leader>D', vim.diagnostic.open_float, { desc = 'Line diagnostics' })
map('n', '[d', function()
  vim.diagnostic.jump { count = -1 }
end, { desc = 'Prev diagnostic' })
map('n', ']d', function()
  vim.diagnostic.jump { count = 1 }
end, { desc = 'Next diagnostic' })

-- ── Formatting ───────────────────────────────────────────────────────────────
map({ 'n', 'v' }, '<leader>cf', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = 'Format file' })

-- ── Git ──────────────────────────────────────────────────────────────────────
map('n', '<leader>gg', '<cmd>lua Snacks.lazygit()<CR>', { desc = 'Lazygit' })
map('n', '<leader>gb', '<cmd>lua Snacks.git.blame_line()<CR>', { desc = 'Git blame line' })

-- ── Config ───────────────────────────────────────────────────────────────────
map('n', '<leader>rc', '<cmd>e ~/.config/nvim/init.lua<CR>', { desc = 'Edit config' })
map('n', '<leader>rr', function()
  vim.cmd.source(vim.fn.stdpath 'config' .. '/init.lua')
  vim.notify('Config reloaded!', vim.log.levels.INFO)
end, { desc = 'Reload config' })

-- ── NvChad UI ────────────────────────────────────────────────────────────────
map('n', '<leader>th', function()
  require('nvchad.themes').open()
end, { desc = 'Theme picker' })
map('n', '<leader>ch', function()
  require('nvchad.cheatsheet').open()
end, { desc = 'Cheatsheet' })

-- ── Markdown ─────────────────────────────────────────────────────────────────
map('n', '<leader>mp', '<cmd>MarkdownPreview<CR>', { desc = 'Markdown preview' })
map('n', '<leader>mt', '<cmd>MarkdownPreviewToggle<CR>', { desc = 'Toggle markdown preview' })
map('n', '<leader>ms', '<cmd>MarkdownPreviewStop<CR>', { desc = 'Stop markdown preview' })
