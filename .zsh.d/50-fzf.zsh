export FZF_CTRL_T_OPTS="--preview '_fzf_preview {}'"
export FZF_TMUX=1

source /etc/profile.d/fzf.zsh

function _is_git_repo() {
    git rev-parse HEAD >/dev/null 2>&1
}

function gr() {
    _is_git_repo || return

    git log --pretty=format:"%C(yellow)%h %C(green)%ad%C(red)%d %C(reset)%s%C(blue) [%an]%C(reset)" --decorate=short --date=relative --graph --color=always |
    fzf --height 40% --ansi --no-sort --reverse \
        --preview "grep -o '[a-f0-9]\{7,\}' <<< {} | head -n1 | xargs git show --color=always" |
    grep -o '[a-f0-9]\{7,\}' <<< {} | head -n1
}

function gb() {
    _is_git_repo || return

    git branch -a | grep -v '/HEAD\s' |
    fzf --height 40% --ansi --reverse \
        --preview 'git log --oneline --graph --decorate=short --date=relative --color=always --pretty="format:%C(green)%ad%C(reset) %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
    sed 's/^..//' | cut -d' ' -f1 |
    sed 's#^remotes/##'
}

bind_git_helper() {
  local c
  for c in $@; do
    eval "fzf_g${c}_widget() { local result=\$(g$c); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf_g${c}_widget"
    eval "bindkey '^g^$c' fzf_g${c}_widget"
  done
}

bind_git_helper r b
unset -f bind_git_helper
