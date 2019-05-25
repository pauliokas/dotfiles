export FZF_CTRL_T_OPTS="--preview '_fzf_preview {}'"
export FZF_TMUX=1

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

function _is_git_repo() {
    git rev-parse HEAD >/dev/null 2>&1
}

function gr() {
    _is_git_repo || return

    git log --pretty=format:"%C(yellow)%h %C(green)%ad%C(red)%d %C(reset)%s%C(blue) [%an]" --decorate=short --date=relative --graph --color=always |
    fzf --height 40% --ansi --no-sort --reverse \
        --preview "grep -o '[a-f0-9]\{7,\}' <<< {} | head -n1 | xargs git show --color=always" |
    grep -o '[a-f0-9]\{7,\}' <<< {} | head -n1
}

function fzf_gr_widget() {
    local result=$(gr)
    zle reset-prompt
    LBUFFER+=$result
}

zle -N fzf_gr_widget

bindkey '^g^r' fzf_gr_widget
