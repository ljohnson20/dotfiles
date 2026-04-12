# Machine & Tooling

- macOS with Homebrew as the primary package manager; prefer `brew` for installs
- Python CLI tools should be installed via `uv tool install`, not the brew formula, to avoid Python 3.14/libexpat incompatibility on macOS
- Runtime versions (node, go, terraform, bun, python) are managed by `mise`
