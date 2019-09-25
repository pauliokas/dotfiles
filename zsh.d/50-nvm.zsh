export NVM_DIR="${HOME}/.nvm"

function nvm() {
  source "/usr/share/nvm/nvm.sh"
  nvm "$@"
}

yarn_orig="$(which yarn)"
function yarn() {
  if [[ -f "$(pwd)/.nvmrc" && "$(nvm version $(cat $(pwd)/.nvmrc))" != "$(nvm current)" ]]; then
    nvm use
  fi

  $yarn_orig "$@"
}
