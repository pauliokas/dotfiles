export NVM_DIR="${HOME}/.nvm"

function nvm() {
  source "/usr/share/nvm/nvm.sh"
  nvm "$@"
}
