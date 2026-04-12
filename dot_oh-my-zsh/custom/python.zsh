uv-reset() {
    rm -rf .venv
    uv venv
    if [[ -f pyproject.toml ]]; then
        uv sync
    elif [[ -f requirements.txt ]]; then
        uv pip install -r requirements.txt
    fi
}

uv-upgrade() {
    latestversion=$(mise latest python)
    mise use python@$latestversion
    if [[ -f pyproject.toml ]]; then
        rm -rf .venv
        uv venv
        uv sync
    elif [[ -f requirements.txt ]]; then
        uv pip freeze > temp_requirements.txt
        rm -rf .venv
        uv venv
        uv pip install -r temp_requirements.txt
        rm temp_requirements.txt
    else
        rm -rf .venv
        uv venv
    fi
}
