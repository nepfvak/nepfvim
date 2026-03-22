-- ================================================================================================
-- TITLE : codecompanion.nvim
-- ABOUT : AI coding assistant supporting multiple providers
-- LINKS :
--   > github : https://github.com/olimorris/codecompanion.nvim
-- SETUP :
--   Add your Gemini API key to your shell config and never commit it:
--   Fish : echo 'set -x GEMINI_API_KEY "your-key-here"' >> ~/.config/fish/config.fish
--   Bash : echo 'export GEMINI_API_KEY="your-key-here"' >> ~/.bashrc
--   Get a free key at https://aistudio.google.com
-- ================================================================================================

return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  event = 'VeryLazy',
  opts = {
    strategies = {
      -- Main chat buffer
      chat = {
        adapter = 'gemini',
      },
      -- Inline code suggestions
      inline = {
        adapter = 'gemini',
      },
      -- Agent/tool use
      agent = {
        adapter = 'gemini',
      },
    },
    adapters = {
      gemini = function()
        return require('codecompanion.adapters').extend('gemini', {
          env = {
            api_key = 'GEMINI_API_KEY', -- reads from $GEMINI_API_KEY env var
          },
          schema = {
            model = {
              default = 'gemini-2.0-flash', -- fast and free
            },
          },
        })
      end,
    },
    display = {
      chat = {
        window = {
          layout = 'vertical', -- opens as a vertical split
          width = 0.35, -- 35% of screen width
        },
      },
      action_palette = {
        provider = 'default',
      },
    },
  },
  keys = {
    -- Toggle chat window
    { '<leader>ac', '<cmd>CodeCompanionChat Toggle<CR>', mode = { 'n', 'v' }, desc = 'AI chat toggle' },
    -- Open chat
    { '<leader>ao', '<cmd>CodeCompanionChat<CR>', mode = { 'n', 'v' }, desc = 'AI chat open' },
    -- Send visual selection to chat
    { '<leader>as', '<cmd>CodeCompanionChat Add<CR>', mode = 'v', desc = 'AI add selection to chat' },
    -- Inline assistant (ask about current buffer/selection)
    { '<leader>ai', '<cmd>CodeCompanion<CR>', mode = { 'n', 'v' }, desc = 'AI inline assist' },
    -- Action palette (refactor, explain, tests, docs, etc.)
    { '<leader>aa', '<cmd>CodeCompanionActions<CR>', mode = { 'n', 'v' }, desc = 'AI actions' },
  },
}
