use_nvm() {
  local nvmsh="$HOME/.nvm/nvm.sh"
  if [ -e $nvmsh ]; then
    source "$nvmsh" 2>/dev/null
  fi

  local nvmrc_path="$(find_up .nvmrc || true)"
  if [ -f "$nvmrc_path" ]; then
    watch_file "$nvmrc_path"
  fi

  local current_version="$(nvm version current)"
  local new_version="${1:-$(cat "${nvmrc_path}" || true)}"

  if [ -n "$new_version" ]; then
    local full_version=$(nvm version "${new_version}")
    if [ "$full_version" = "N/A" ]; then
      log_error "node version is not installed: $new_version"
      return 1
    elif [ "$full_version" != "$current_version" ]; then
      nvm use $new_version >/dev/null
    fi
  elif [ "$current_version" != "$(nvm version default)" ]; then
    nvm use default >/dev/null
  fi
}
