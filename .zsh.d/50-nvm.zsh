export NVM_DIR="$(realpath ${HOME}/.nvm)"

function nvm() {
  source "/usr/share/nvm/nvm.sh"
  nvm "$@"
}
