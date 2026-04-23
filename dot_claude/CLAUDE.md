# Machine & Tooling

- macOS with Homebrew as the primary package manager; prefer `brew` for installs
- Python CLI tools should be installed via `uv tool install`, not the brew formula, to avoid Python 3.14/libexpat incompatibility on macOS
- Runtime versions (node, go, terraform, bun, python) are managed by `mise`

# Folder Structure

- All coding projects are placed in the `~/repos` folder each folder is a project or subsequent worktrees
