command -v fzf >/dev/null || return 0

# export FZF_CTRL_T_OPTS="--preview '${HOME}/.zsh.d/fzf.vim/bin/preview.sh {}'"
# export FZF_TMUX=1

function _is_git_repo() {
    git rev-parse HEAD >/dev/null 2>&1
}

function _fzf_git_log() {
    _is_git_repo || return

    git log --pretty=format:"%C(yellow)%h %C(green)%ad%C(red)%d %C(reset)%s%C(blue) [%an]%C(reset)" --decorate=short --date=relative --graph --color=always |
    fzf --height 40% --ansi --no-sort --reverse \
        --preview "git show --color=always {2} 2>/dev/null" |
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
    local -r cmd="git -c color.status=always status --short"

    local -r return_contents=$(
        git -c color.status=always status --short |
        fzf --height 40% --ansi --cycle --keep-right --no-sort --layout=reverse --nth=2.. \
            --preview 'git diff --color=always HEAD -- {+2..}' \
            --preview-window 'right:wrap' \
            --expect 'alt-p' \
            --bind "right:execute-silent(git add {+2..})+reload($cmd)" \
            --bind "left:execute-silent(git restore --staged {+2..})+reload($cmd)" \
            --bind "alt-p:execute-silent(git add --patch {+2..})+reload($cmd)" \
            --bind "alt-c:execute(git commit)"
    )
    local -r return_head=$(echo "$return_contents" | head -n1)
    local -r return_tail=$(echo "$return_contents" | tail -n+2)

    if [ "$return_head" = "alt-p" ]; then
        git add --patch $(echo "$return_tail" | cut -c4-)
    fi
}

# function _gh_pr_list() {
#     # echo "$*"
#     GH_FORCE_TTY="100%" gh pr list | tail -n+4
# }

# function _xxx() {
#     _gh_pr_list | fzf --ansi --cycle --no-sort --layout=reverse \
#         --preview 'GH_FORCE_TTY=1 gh pr view {1}; echo ""; GH_FORCE_TTY=1 gh pr checks {1}; echo ""; GH_FORCE_TTY=1 gh pr diff {1}' \
#         --preview-window ':wrap' \
#         # --bind "change:reload(echo \$PATH)"
#         --expect 'alt-o' \
#         --expect 'alt-c' \
#         --expect 'enter'
# }

function _fzf_git_prs() {
    GH_FORCE_TTY='50%' gh pr list |
    fzf \
        --ansi \
        --header-lines=3 \
        --preview-window="down,80%" \
        --preview='GH_FORCE_TTY=$FZF_PREVIEW_COLUMNS gh pr view {1}; echo; gh pr diff {1}'
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

# _fzf_complete_git() {
#     echo "$@"
# }
