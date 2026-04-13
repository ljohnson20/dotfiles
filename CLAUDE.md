# chezmoi dotfiles

## Validation

After making changes, run these commands to confirm nothing is broken before committing.

### Dry-run apply
```sh
chezmoi apply --dry-run --verbose
```
Simulates the full apply. If this exits cleanly, the setup is valid.

### Validate templates
```sh
find ~/.local/share/chezmoi -name "*.tmpl" ! -name ".chezmoi.toml.tmpl" | xargs -I {} sh -c 'echo "==> {}" && chezmoi execute-template < "{}"'
```
Renders every `.tmpl` file to stdout. Catches syntax errors or missing variables.

## Secrets baseline

The `.secrets.baseline` tracks known-safe detections for `detect-secrets` (run via pre-commit). The current baseline has no results because all `.tmpl` files are filtered by the `is_templated_secret` heuristic.

Regenerate it when:
- A **new file is added** that trips a detector and the pre-commit hook blocks the commit — scan to acknowledge it as safe, then commit the updated baseline alongside the new file
- A **tracked file is removed** that had entries in the baseline — regenerate to drop the stale entries

To regenerate:
```sh
detect-secrets scan --baseline .secrets.baseline
```
