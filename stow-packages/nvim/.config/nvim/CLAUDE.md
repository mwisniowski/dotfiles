# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a modern, modular Neovim configuration using lazy.nvim as the plugin manager. The configuration follows a clean separation pattern:

- `init.lua` - Main entry point that loads the config module
- `lua/config/` - Core configuration (options, keymaps, autocmds, lazy.nvim setup)
- `lua/plugins/` - Individual plugin configurations, one file per plugin

## Key Configuration Patterns

**Plugin Management**: Each plugin has its own file in `lua/plugins/` that returns a lazy.nvim spec table. Plugins are lazy-loaded based on events, commands, and file types.

**LSP Integration**: Comprehensive LSP setup with Mason for automatic server installation, nvim-cmp for completion, and none-ls for formatters/linters.

**Leader Key**: Comma (`,`) serves as the leader key for custom mappings.

**Testing**: Neotest framework with Python (pytest) and JavaScript/TypeScript (Jest) support.

## Common Commands

### Plugin Management
- `:Lazy` - Open plugin manager interface
- `:Lazy sync` - Install/update plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy update` - Update all plugins

### Testing Commands
- `<leader>tn` - Test nearest
- `<leader>tf` - Test file  
- `<leader>ts` - Test suite
- `<leader>to` - Open test output
- `<leader>tS` - Toggle test summary

### LSP Commands
- `gd` - Go to definition
- `gr` - Find references
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `<leader>af` - Format buffer

### Navigation
- `<leader>f` - Find files (Telescope)
- `<leader>b` - Open buffers
- `<leader>g` - Grep text
- `<leader>e` - Toggle file tree

## Language Support

**LSP Servers** (auto-installed via Mason):
- Python: pyright
- JavaScript/TypeScript: ts_ls
- Lua: lua_ls
- HTML/CSS: html, cssls
- JSON: jsonls
- YAML: yamlls
- Bash: bashls
- Docker: dockerls
- TailwindCSS: tailwindcss
- SQL: sqlls

**Formatters/Linters**:
- Python: black, isort, pylint
- JavaScript/TypeScript: prettier, eslint_d
- Lua: stylua
- Shell: shfmt
- SQL: sqlfluff

## File Structure Notes

- `lazy-lock.json` - Plugin version lockfile for reproducible installs
- Configuration automatically bootstraps lazy.nvim on first run
- Plugin configurations use lazy loading for performance
- Error handling implemented with pcall and vim.notify
- Git integration via gitsigns, fugitive, and diffview
- Database interface available via vim-dadbod-ui

## Development Workflow

1. Make changes to plugin configurations in `lua/plugins/`
2. Restart Neovim or use `:source %` to reload changes
3. Use `:Lazy sync` to install new plugins or update existing ones
4. Test changes with the comprehensive testing setup via Neotest
5. Use LSP features for code intelligence and formatting