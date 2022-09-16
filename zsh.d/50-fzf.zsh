command -v fzf >/dev/null || return

export FZF_CTRL_T_OPTS="--preview '_fzf_preview {}'"
export FZF_TMUX=1

case "$OSTYPE" in
    darwin*)
        source /opt/homebrew/opt/fzf/shell/completion.zsh
        source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
        ;;
    linux*)
        source /usr/share/fzf/completion.zsh
        source /usr/share/fzf/key-bindings.zsh
        ;;
esac

function _is_git_repo() {
    git rev-parse HEAD >/dev/null 2>&1
}

function _fzf_git_log() {
    _is_git_repo || return

    git log --pretty=format:"%C(yellow)%h %C(green)%ad%C(red)%d %C(reset)%s%C(blue) [%an]%C(reset)" --decorate=short --date=relative --graph --color=always |
    fzf --height 40% --ansi --no-sort --reverse \
        --preview "git show --color=always {2}" |
    grep -o '[a-f0-9]\{7,\}' <<< {} | head -n1
}

function _fzf_git_branches() {
    _is_git_repo || return

    git branch -a | grep -v '/HEAD\s' |
    fzf --height 40% --ansi --reverse \
        --preview 'git log --oneline --graph --decorate=short --date=relative --color=always --pretty="format:%C(green)%ad%C(reset) %s" {-1}' |
    sed 's/^..//' | cut -d' ' -f1 |
    sed 's#^remotes/##'
}

function _fzf_git_status() {
    local -r command="git -c color.status=always status --short"

    git -c color.status=always status --short |
    fzf --height 40% --ansi --cycle --keep-right --no-sort --layout=reverse \
        --preview 'git diff --color=always HEAD -- {+2..}' \
        --preview-window 'down:wrap' \
        --expect 'alt-c' \
        --bind "right:execute-silent(git add {+2..})+down+reload($command)" \
        --bind "left:execute-silent(git restore --staged {+2..})+down+reload($command)" \
        --bind "alt-c:execute(git commit)"
}

function _gh_pr_list() {
    # echo "$*"
    GH_FORCE_TTY="100%" gh pr list | tail -n+4
}

function _xxx() {
    _gh_pr_list | fzf --ansi --cycle --no-sort --layout=reverse \
        --preview 'GH_FORCE_TTY=1 gh pr view {1}; echo ""; GH_FORCE_TTY=1 gh pr checks {1}; echo ""; GH_FORCE_TTY=1 gh pr diff {1}' \
        --preview-window ':wrap' \
        # --bind "change:reload(echo \$PATH)"
        --expect 'alt-o' \
        --expect 'alt-c' \
        --expect 'enter'
}

function _fzf_git_prs() {
    local -r output=$(eval '_xxx')
    echo $output
    # local -r cmd=$(echo $output | head -n1)
    # local -r prnumber=$(echo $output | tail -n+2 | awk '{ print $1 }')

    # if [[ "$cmd" == 'alt-o' ]]; then
    #     gh pr view --web "$prnumber"
    # elif [[ "$cmd" == 'enter' ]]; then
    #     gh pr checkout "$prnumber"
    # fi
}

function bind_git_helper() {
    local -r func="$1"
    local -r char="$2"

    eval "fzf_g${char}_widget() { local result=\$($func); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf_g${char}_widget"
    eval "bindkey '^g^$char' fzf_g${char}_widget"
}

bind_git_helper _fzf_git_log l
bind_git_helper _fzf_git_branches b
# bind_git_helper _fzf_git_status s
bind_git_helper _fzf_git_prs p

unset -f bind_git_helper

_fzf_complete_git() {
    echo "$@"
}
