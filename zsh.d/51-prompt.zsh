autoload -Uz promptinit
promptinit

autoload -Uz add-zsh-hook

setopt prompt_subst

function _newline_before_prompt() {
  if [ -z "$_print_newline_before_prompt" ]; then
    _print_newline_before_prompt=1
  elif [ "$_print_newline_before_prompt" -eq 1 ]; then
    printf '\n'
  fi
}
add-zsh-hook precmd _newline_before_prompt

_last_command_started=0
function _save_last_command_start() {
  _last_command_started="$SECONDS"
  _last_command_duration=""
}
add-zsh-hook preexec _save_last_command_start

_last_command_duration=0
function _save_command_duration() {
  if [[ -z "$_last_command_started" ]]; then
    return
  fi

  _last_command_duration="$(( SECONDS - _last_command_started ))"
  if [[ "$_last_command_duration" -le 5 ]]; then
    _last_command_duration=""
  fi

  unset _last_command_started
}
add-zsh-hook precmd _save_command_duration

function _print_command_duration() {
  if [[ -z "$_last_command_duration" ]]; then
    return
  fi

  readonly local hours=$(( $_last_command_duration / 3600 ))
  readonly local minutes_total=$(( $_last_command_duration % 3600 ))
  readonly local minutes=$(( $minutes_total / 60 ))
  readonly local seconds=$(( $minutes_total % 60 ))

  local str=""

  if [ $hours -gt 0 ]; then
    str="%F{red}$hours%F{yellow}h%f"
  fi

  if [ $minutes -gt 0 ]; then
    str+="%F{red}$minutes%F{yellow}m%f"
  fi

  str+="%F{red}$seconds%F{yellow}s%f"

  echo "$str "
}

function _output_hostname() {
  if [ -z $SSH_CLIENT ]; then
    return
  fi

  echo '%F{magenta}%m%F{yellow}:%f'
}

function _print_aws_info() {
  if [ -z $AWS_PROFILE ]; then
    return;
  fi

  echo "%F{magenta}aws%F{yellow}:%F{magenta}$AWS_PROFILE%f "
}

PROMPT=''
PROMPT+='$(_output_hostname)'
PROMPT+='%F{blue}%(5~:%-1~/../%2~:%~)%f '
PROMPT+='%(!:%F{red}:%F{green})%#%f '

source "${HOME}/.zsh.d/gitstatus/gitstatus.plugin.zsh"
gitstatus_stop 'prompt' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'prompt'

function gitstatus_prompt_update() {
  emulate -L zsh
  typeset -g  GITSTATUS_PROMPT=''
  typeset -gi GITSTATUS_PROMPT_LEN=0

  # Call gitstatus_query synchronously. Note that gitstatus_query can also be called
  # asynchronously; see documentation in gitstatus.plugin.zsh.
  gitstatus_query 'prompt'              || return 1  # error
  [[ $VCS_STATUS_RESULT == 'ok-sync' ]] || return 0  # not a git repo

  local      clean='%F{green}'   # green foreground
  local   modified='%F{yellow}'  # yellow foreground
  local  untracked='%F{blue}'    # blue foreground
  local conflicted='%F{red}'     # red foreground

  local p

  local where  # branch name, tag or commit
  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    where=$VCS_STATUS_LOCAL_BRANCH
  elif [[ -n $VCS_STATUS_TAG ]]; then
    p+='%f#'
    where=$VCS_STATUS_TAG
  else
    p+='%f@'
    where=${VCS_STATUS_COMMIT[1,8]}
  fi

  (( $#where > 32 )) && where[13,-13]="…"  # truncate long branch names and tags
  p+="${clean}${where//\%/%%}"             # escape %

  # ⇣42 if behind the remote.
  (( VCS_STATUS_COMMITS_BEHIND )) && p+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
  # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
  (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && p+=" "
  (( VCS_STATUS_COMMITS_AHEAD  )) && p+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
  # *42 if have stashes.
  (( VCS_STATUS_STASHES        )) && p+=" ${clean}*${VCS_STATUS_STASHES}"
  # 'merge' if the repo is in an unusual state.
  [[ -n $VCS_STATUS_ACTION     ]] && p+=" ${conflicted}${VCS_STATUS_ACTION}"
  # ~42 if have merge conflicts.
  (( VCS_STATUS_NUM_CONFLICTED )) && p+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
  # +42 if have staged changes.
  (( VCS_STATUS_NUM_STAGED     )) && p+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
  # !42 if have unstaged changes.
  (( VCS_STATUS_NUM_UNSTAGED   )) && p+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
  # ?42 if have untracked files. It's really a question mark, your font isn't broken.
  (( VCS_STATUS_NUM_UNTRACKED  )) && p+=" ${untracked}?${VCS_STATUS_NUM_UNTRACKED}"

  GITSTATUS_PROMPT="(${p}%f)"

  # The length of GITSTATUS_PROMPT after removing %f and %F.
  GITSTATUS_PROMPT_LEN="${(m)#${${GITSTATUS_PROMPT//\%\%/x}//\%(f|<->F)}}"
}
add-zsh-hook precmd gitstatus_prompt_update

RPROMPT=''
RPROMPT+='%(0?::%F{red}(%?%)%f )'
RPROMPT+='$(_print_command_duration)'
RPROMPT+='$(_print_aws_info)'
RPROMPT+='$GITSTATUS_PROMPT'
