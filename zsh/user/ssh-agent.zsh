function () {
    local environment_path="$HOME/.ssh/environment"

    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent > $environment_path
    fi

    chmod 600 $environment_path

    if [[ ! "$SSH_AUTH_SOCK" ]]; then
        eval "$(<$environment_path)" >/dev/null
    fi
}
