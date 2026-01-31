return {
  { 'ellisonleao/gruvbox.nvim', priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 'NvChad/nvim-colorizer.lua', opts = { user_default_options = { names = false } } },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = { options = { theme = 'catppuccin-mocha' } }
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = false },  -- Using statuscol.nvim instead
      words = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      terminal = { enabled = true },
      image = {
        enabled = true,
        doc = {
          enabled = true,     -- enable image viewer for documents
          inline = true,      -- render images inline in the buffer
          float = true,       -- fallback to floating window if inline not supported
          max_width = 80,     -- max width for inline images
          max_height = 40,    -- max height for inline images
        },
      },
    },
    keys = {
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
      { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
      { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
      { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
      { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
      
      -- Snacks Picker (parallel to Telescope for testing)
      -- Files & Search
      { "<leader>sf", function() Snacks.picker.files() end, desc = "Snacks: Find Files" },
      { "<leader>sa", function() Snacks.picker.files({ hidden = true, ignored = true }) end, desc = "Snacks: Find All Files" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Snacks: Grep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Snacks: Grep Word", mode = { "n", "x" } },
      { "<leader>sb", function() Snacks.picker.buffers() end, desc = "Snacks: Buffers" },
      { "<leader>sr", function() Snacks.picker.recent() end, desc = "Snacks: Recent Files" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "Snacks: Help" },
      
      -- LSP Symbols
      { "<leader>sls", function() Snacks.picker.lsp_symbols() end, desc = "Snacks: LSP Symbols" },
      { "<leader>slS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Snacks: LSP Workspace Symbols" },
      
      -- Diagnostics
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Snacks: Diagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Snacks: Buffer Diagnostics" },
      
      -- Git
      { "<leader>sgs", function() Snacks.picker.git_status() end, desc = "Snacks: Git Status" },
      { "<leader>sgf", function() Snacks.picker.git_log_file() end, desc = "Snacks: Git Log File" },
      { "<leader>sgl", function() Snacks.picker.git_log() end, desc = "Snacks: Git Log" },
      { "<leader>sgb", function() Snacks.picker.git_branches() end, desc = "Snacks: Git Branches" },
      
      -- Power User
      { "<leader>sR", function() Snacks.picker.resume() end, desc = "Snacks: Resume Picker" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Snacks: Keymaps" },
      { "<leader>sc", function() Snacks.picker.commands() end, desc = "Snacks: Commands" },
    },
    init = function()
      vim.ui.select = function(...) Snacks.picker.select(...) end
      vim.ui.input = function(...) Snacks.input.input(...) end

      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for easier access
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd
        end,
      })
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          view = "notify",
          filter = {
            event = "msg_showmode",
            find = "recording"
          },
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    dependencies = { 'MunifTanjim/nui.nvim' }
  },
  { 'folke/trouble.nvim', cmd = 'TroubleToggle' },
}
