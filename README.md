# NEPFVIM
A clean, beginner-friendly Neovim config built on [normie-nvim](https://github.com/lcsmuller/normie-nvim) with NvChad's base46 theme engine bolted on for 68 beautiful themes and a live theme picker.


<img width="2506" height="1345" alt="image" src="https://github.com/user-attachments/assets/73aa14da-be85-4bc4-9425-9d3cc65289c7" />
<img width="2507" height="1345" alt="image" src="https://github.com/user-attachments/assets/70a33cb2-62d1-4778-9c6c-aac8b5b19a2a" />
<img width="2506" height="1344" alt="image" src="https://github.com/user-attachments/assets/3bbfa97b-cf11-489d-9a1e-950e3adf3e1d" />

---

## Features

- **68 themes** via NvChad's base46 engine with a live picker (`<Space>th`)
- **Snacks.nvim** — file explorer, fuzzy finder, dashboard, notifications, lazygit
- **blink.cmp** — fast autocompletion with LuaSnip snippets
- **LSP** — lua, python, typescript, rust, c/c++, bash, html, css, hyprland and more
- **Treesitter** — syntax highlighting + textobjects
- **Conform + nvim-lint** — format on save, per-language linters
- **Gitsigns** — inline git diff, hunk staging
- **Which-key** — keymap hints as you type
- **OpenCode** — AI coding assistant (Gemini, Claude, ChatGPT)
- **mini.nvim suite** — surround, pairs, comments, move, cursorword and more

---

## Requirements

- Neovim >= 0.10
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (config uses JetBrains Mono Nerd Font)
- `ripgrep` — for live grep (`rg`)
- `luacheck` — for Lua linting (`yay -S luacheck` on CachyOS/Arch)
- `opencode` — AI assistant (`yay -S opencode-bin` on CachyOS/Arch)
- Optional: `lazygit` for `<Space>gg`

---

## Install

### One-line install (recommended)
```bash
bash <(curl -s https://raw.githubusercontent.com/nepfvak/nepfvim/main/install.sh)
```

This will:
- Detect your OS (Arch, Fedora, Debian/Ubuntu)
- Install all dependencies (neovim, git, ripgrep, fd, fzf, etc.)
- Install Rust via rustup
- Install Node.js via nvm
- Back up any existing Neovim config to `~/.config/nvim.backup.<timestamp>`
- Clone and install this config
- Bootstrap all plugins automatically

### Manual install

> **Back up your existing config first if you have one:**
> ```bash
> mv ~/.config/nvim ~/.config/nvim.bak
> ```
```bash
git clone https://github.com/nepfvak/nepfvim.git ~/.config/nvim
nvim
```

Lazy will bootstrap itself and install all plugins on first launch.
## AI Assistant Setup (OpenCode)

OpenCode supports Gemini (free), Claude, and ChatGPT. Get your API keys and add them to your shell — **never put them in the config files**.

**Fish:**
```bash
echo 'set -x GEMINI_API_KEY "your-key-here"' >> ~/.config/fish/config.fish
echo 'set -x ANTHROPIC_API_KEY "your-key-here"' >> ~/.config/fish/config.fish
echo 'set -x OPENAI_API_KEY "your-key-here"' >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish
```

**Bash/Zsh:**
```bash
echo 'export GEMINI_API_KEY="your-key-here"' >> ~/.bashrc
echo 'export ANTHROPIC_API_KEY="your-key-here"' >> ~/.bashrc
echo 'export OPENAI_API_KEY="your-key-here"' >> ~/.bashrc
source ~/.bashrc
```

Get a free Gemini API key at [aistudio.google.com](https://aistudio.google.com).

---

## Key Bindings

### General
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `;` | Command mode |
| `kj` | Exit insert mode |
| `<C-s>` | Save file |

### Theme & UI
| Key | Action |
|-----|--------|
| `<Space>th` | Theme picker (68 themes, live preview) |
| `<Space>ch` | Cheatsheet |

### File Navigation
| Key | Action |
|-----|--------|
| `<Space>e` | File explorer |
| `<Space><Space>` | Find files |
| `<Space>fs` | Live grep |
| `<Space>fr` | Recent files |

### LSP
| Key | Action |
|-----|--------|
| `<leader>gd` | Go to definition |
| `gi` | Go to implementations |
| `K` | Hover docs |
| `<Space>ca` | Code action |
| `<Space>rn` | Rename symbol |
| `<Space>cf` | Format file |
| `<leader>[d` / `<leader>]d` | Prev/next diagnostic |

### Git
| Key | Action |
|-----|--------|
| `]h` / `[h` | Next/prev hunk |
| `<Space>ghs` | Stage hunk |
| `<Space>ghr` | Reset hunk |
| `<Space>ghb` | Blame line |
| `<Space>ghd` | Diff this |

### AI (OpenCode)
| Key | Action |
|-----|--------|
| `<Space>oc` | Open OpenCode in vertical split |

### Windows & Splits
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate windows |
| `<Space>ss` | Split vertically |
| `<Space>sh` | Split horizontally |
| `<Space>sv` | Equalize splits |
| `<Space>sl` | Close split |

### Tabs
| Key | Action |
|-----|--------|
| `L` | Next tab |
| `H` | Prev tab |
| `<Space>tt` | New tab |
| `<Space>tl` | Close tab |

---

## Updating

```bash
cd ~/.config/nvim
git pull
```

Then inside Neovim:

```
:Lazy sync
```

---

## Credits

- [normie-nvim](https://github.com/lcsmuller/normie-nvim) — the base config
- [NvChad](https://github.com/NvChad/NvChad) — base46 theme engine
- [folke](https://github.com/folke) — lazy.nvim, snacks.nvim, which-key, noice, todo-comments, persistence
- [opencode-ai](https://opencode.ai) — AI coding assistant
