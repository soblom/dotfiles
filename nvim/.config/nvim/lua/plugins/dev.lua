return {
  { 'kristijanhusak/vim-dadbod-ui',
    dependencies = 'tpope/vim-dadbod',
    cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' } },
  { 'github/copilot.vim' },
  { 'NickvanDyke/opencode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    config = function()
      -- Required for opts.events.reload (auto-reload edited buffers)
      vim.o.autoread = true

      -- Configuration with snacks.nvim integration
      vim.g.opencode_opts = {
        provider = {
          enabled = "snacks",
          snacks = {
            -- Default: neutral terminal open (no auto-continue)
            cmd = function()
              return { "opencode" }
            end,
          },
        },
      }
    end,
    keys = {
      -- Primary actions: Open/Continue/New
      { "<leader>ot", function() require("opencode").toggle() end, mode = { "n", "t" }, desc = "OpenCode: Toggle terminal" },
      { "<leader>oo", function() require("opencode").toggle({ cmd = { "opencode", "--continue" } }) end, desc = "OpenCode: Continue last session" },
      { "<leader>on", function() require("opencode").command("session.new") end, desc = "OpenCode: New session" },

      --Quick actions
      { "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, mode = { "n", "x" }, desc = "OpenCode: Ask with @this context" },
      { "<leader>ox", function() require("opencode").select() end, mode = { "n", "x" }, desc = "OpenCode: Select action" },

      -- Operator mode: Add range/selection to OpenCode
      { "<leader>o", function() return require("opencode").operator("@this ") end, mode = { "n", "x" }, expr = true, desc = "OpenCode: Add range to prompt" },
      { "<leader>oL", function() return require("opencode").operator("@this ") .. "_" end, expr = true, desc = "OpenCode: Add current line to prompt" },

      -- Scroll OpenCode messages
      { "<leader>ou", function() require("opencode").command("session.half.page.up") end, desc = "OpenCode: Scroll half page up" },
      { "<leader>od", function() require("opencode").command("session.half.page.down") end, desc = "OpenCode: Scroll half page down" },

      -- Session management
      { "<leader>ol", function() require("opencode").command("session.list") end, desc = "OpenCode: List sessions" },
      { "<leader>os", function() require("opencode").command("session.share") end, desc = "OpenCode: Share session" },
      { "<leader>oc", function() require("opencode").command("session.compact") end, desc = "OpenCode: Compact session" },
    },
  }
}
