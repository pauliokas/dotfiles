function _fzf_preview() {
    selected_path=$1

    if [[ $(file --mime $selected_path) =~ inode/directory ]]; then
        ls -shF1 --color=always $selected_path
        return
    fi

    if [[ $(file --mime $selected_path) =~ binary ]]; then
        return
    fi

    bat --style "plain" --color "always" $selected_path 2>/dev/null \
        || cat $selected_path
}
