# Neovim Configuration

## Installation

1. **Install Neovim**
2. **Clone Configuration Repository**:
    ```sh
    git clone https://github.com/kasaderos/nvimconf.git ~/.config/nvim
    sudo apt-get install ripgrep
    ```

This Neovim configuration includes various key mappings and settings to enhance your development workflow.

## Key Mappings

### General

- **Leader Key**: The leader key is set to `space`.
- **Open Explorer**: `<leader>ex` opens the file explorer.
- **Cancel**: `<C-c>` exits insert mode.
- **Copy Selected Block**: `<leader>y` copies the selected block to the system clipboard.
- **Copy Current Line**: `<leader>yl` copies the current line to the system clipboard.
- **Paste from Clipboard**: `<leader>p` pastes the contents of the system clipboard.

### LSP (Language Server Protocol)

When an LSP server is attached, the following key mappings are available:

- **Go to Definition**: `gd` navigates to the definition of the symbol under the cursor.
- **Hover Documentation**: `K` shows hover documentation.
- **Workspace Symbol Search**: `<leader>vws` searches for a workspace symbol.
- **Open Diagnostics Float**: `<leader>vd` opens a floating window with diagnostic information.
- **Code Action**: `<leader>vca` performs a code action.
- **References**: `<leader>vrr` lists references to the symbol under the cursor.
- **Rename Symbol**: `<leader>vrn` renames the symbol under the cursor.
- **Signature Help**: `<C-h>` shows signature help in insert mode.
- **Next Diagnostic**: `[d` navigates to the next diagnostic message.
- **Previous Diagnostic**: `]d` navigates to the previous diagnostic message.

### Git Integration (via `vim-fugitive`)

- **Git Status**: `<leader>git` opens the Git status window.
- **Git Push**: `<leader>gP` pushes changes to the remote repository.
- **Git Pull (Rebase)**: `<leader>gp` pulls changes with rebase.
- **Git Push with Tracking**: `<leader>t` allows setting the branch for pushing with tracking.
- **Diffget (Local)**: `gu` gets the local version of the diff.
- **Diffget (Remote)**: `gh` gets the remote version of the diff.

### Telescope (Fuzzy Finder)

- **Find Files**: `<leader>ff` opens the file finder.
- **Live Grep**: `<leader>fg` searches for a string in the current working directory.
- **Help Tags**: `<leader>th` searches help tags.
- **Git Files**: `<C-p>` searches for files tracked by Git.
- **Grep Current Word**: `<leader>tws` searches for the current word under the cursor.
- **Grep Current WORD**: `<leader>tss` searches for the current WORD under the cursor.
- **Custom Grep**: `<leader>gg` prompts for a custom string to search for.

## Auto Commands

- **Remove Trailing Whitespace**: Automatically removes trailing whitespace before saving a buffer.
- **LSP Attach Commands**: Sets up LSP-related key mappings when an LSP server is attached.
- **AI Suggestions**: Sign up in Codeium and run this `:Codeium Auth`
