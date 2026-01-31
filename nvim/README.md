# Neovim Configuration Setup

Modern Neovim configuration optimized for 2025 with native features, fast completion, and excellent tooling.

## Quick Start

### 1. Install System Dependencies

```bash
# From the nvim directory
brew bundle --file=Brewfile
```

### 2. Launch Neovim

```bash
nvim
```

On first launch:
- Lazy.nvim will automatically install all plugins
- Treesitter parsers will be installed automatically
- Wait for everything to complete

### 3. Install LSP Servers & Formatters (via Mason)

Open Neovim and run `:Mason`, then install:

**LSP Servers** (auto-installed on first use, but you can pre-install):
- `pyright` - Python LSP
- `ts_ls` - TypeScript/JavaScript LSP
- `bashls` - Bash LSP
- `cucumber_language_server` - Cucumber/Gherkin LSP
- `tinymist` - Typst LSP

**Formatters** (recommended for conform.nvim):
- `stylua` - Lua formatter
- `black` - Python formatter
- `isort` - Python import sorter
- `prettierd` or `prettier` - JS/TS/JSON/YAML/Markdown formatter
- `shfmt` - Shell script formatter

**Alternative:** Install formatters via system package manager:
```bash
# Via Homebrew
brew install stylua prettier
pip install black isort
brew install shfmt

# Via npm
npm install -g prettier
```

### 5. Verify Health

```vim
:checkhealth
```

## Key Features

### Modern 2025 Stack
- **Native snippets**: Using Neovim 0.10+ built-in `vim.snippet` (no LuaSnip needed)
- **blink.cmp**: Rust-based completion engine (much faster than nvim-cmp)
- **snacks.nvim**: Consolidated UI/terminal/git integration
- **conform.nvim**: Professional formatting with format-on-save
- **LspAttach autocmd**: Modern LSP setup pattern

### Plugin Organization
```
lua/plugins/
├── dev.lua          # Development tools (copilot, opencode)
├── formatting.lua   # Code formatting (conform.nvim)
├── lsp_cmp.lua      # LSP and completion (mason, blink.cmp)
├── markdown.lua     # Markdown rendering and preview
├── misc.lua         # Utilities (fugitive, surround, mini.nvim, todo-comments)
├── telescope.lua    # Fuzzy finder
├── treesitter.lua   # Syntax highlighting
├── typst.lua        # Typst support & preview
├── ui.lua           # UI plugins (snacks, noice, lualine, themes)
└── nvim-tree.lua    # File explorer
```

## Key Mapping Strategy

**Leader Key:** `,`

This configuration follows a structured mapping convention to ensure performance and maintainability:

### 1. Centralized Mappings (`lua/mappings.lua`)
Core Neovim behavior and global navigation (e.g., buffer cycling, `jj` for escape). Plugin-specific commands are never placed here.

### 2. Plugin-Specific Mappings (`lua/plugins/*.lua`)
Shortcuts for plugin features (e.g., Telescope, Typst Preview, OpenCode). These are defined in the `keys` table of the plugin spec to enable lazy-loading.

### 3. LSP Mappings (`lua/lsp.lua`)
Generic coding intelligence (e.g., `gd` for definition, `gr` for references). These are defined within the `LspAttach` autocmd and apply across all supported languages.

## Setup on New Machines

1. Clone dotfiles
2. `cd nvim && brew bundle --file=Brewfile`
3. `nvim` - wait for plugins to install
4. `:Mason` - install LSP servers and formatters
5. `:checkhealth` - verify everything works

## Optional Setup
While Mason can install formatters, you might prefer system-wide installation:
```bash
# Lua
brew install stylua

# Python
pip install black isort

# JavaScript/TypeScript/JSON/YAML/Markdown
npm install -g prettier
# OR for better performance:
npm install -g @fsouza/prettierd

# Shell scripts
brew install shfmt
```

## Troubleshooting

### Missing formatters
Run `:ConformInfo` to see which formatters are available. Install missing ones via `:Mason`.

### LSP not working
Run `:LspInfo` to see active LSP servers. Install missing ones via `:Mason`.

### Treesitter errors
Run `:TSUpdate` to update all parsers.

### General health check
Run `:checkhealth` to see all issues.

## What's Modern About This Config

- **Performance**: blink.cmp is significantly faster than nvim-cmp
- **Native features**: Using Neovim 0.10+ built-in snippets and modern APIs
- **Consolidation**: snacks.nvim replaces multiple single-purpose plugins
- **Best practices**: LspAttach autocmd, conform.nvim for formatting, proper lazy-loading
- **Mini.nvim**: Lightweight, fast alternatives to bloated plugins
- **Future-proof**: All plugins actively maintained and recommended by the community
