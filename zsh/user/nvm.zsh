export NVM_DIR="$(realpath $HOME/.nvm)"

function nvm() {
  source "$NVM_DIR/nvm.sh"
  nvm "$@"
}
