# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## What's in here

| Path | Target |
|------|--------|
| `dot_zshrc.tmpl` | `~/.zshrc` |
| `dot_gitconfig.tmpl` | `~/.gitconfig` |
| `dot_claude/` | `~/.claude/` |
| `dot_config/mise/` | `~/.config/mise/` |
| `dot_config/nvim/` | `~/.config/nvim/` |
| `dot_oh-my-zsh/custom/` | `~/.oh-my-zsh/custom/` |

## First-time setup

```sh
# 1. Clone the repo into chezmoi's source directory
git clone git@github.com:ljohnson20/dotfiles.git ~/.local/share/chezmoi

# 2. Install Homebrew, Oh My Zsh, and all packages
~/.local/share/chezmoi/setup.sh

# 3. Apply dotfiles (now that all dependencies exist)
chezmoi apply
```

Step 3 will prompt for:
- **Full name** — used in `~/.gitconfig`
- **Email address** — used in `~/.gitconfig`
- **GitHub Personal Access Token** — written to `~/.env`

## Daily usage

| Task | Command |
|------|---------|
| Apply changes from source | `chezmoi apply` |
| Edit a managed file | `chezmoi edit ~/.zshrc` |
| Add a new file | `chezmoi add ~/.newfile` |
| See what would change | `chezmoi diff` |
| Pull & apply latest | `chezmoi update` |

## Adding packages

Open `Brewfile` and add a new line:

```ruby
brew "your-formula"   # CLI tool
cask "your-cask"      # GUI app
```

Run `brew bundle` to apply, or re-run `setup.sh`.

## Contributing / local development

Pre-commit hooks are configured via `.pre-commit-config.yaml`. `pre-commit` is installed via `uv` in the `Brewfile` (not as a brew formula) to avoid a Python 3.14/libexpat incompatibility on macOS. After running `setup.sh`:

```sh
pre-commit install
```
