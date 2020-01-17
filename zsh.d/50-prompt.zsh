autoload -Uz promptinit
promptinit

source "${HOME}/.zsh.d/gitstatus/gitstatus.prompt.zsh"

_last_command_started=0

PROMPT=''
PROMPT+='%(0?::%F{red}(%?%)%f) '
PROMPT+='%F{blue}%(5~:%-1~/../%2~:%~)%f '
PROMPT+='%($((_last_command_started + 5))S:%F{red}$(( SECONDS - _last_command_started ))%F{yellow}s%f :)'
PROMPT+='%(!:%F{red}:%F{green})%#%f '

RPROMPT='$GITSTATUS_PROMPT'

autoload -Uz add-zsh-hook

function _newline_before_prompt() {
  if [ -z "$_print_newline_before_prompt" ]; then
    _print_newline_before_prompt=1
  elif [ "$_print_newline_before_prompt" -eq 1 ]; then
    printf '\n'
  fi
}
add-zsh-hook precmd _newline_before_prompt

function _save_last_command_start() {
  _last_command_started=$SECONDS
}
add-zsh-hook preexec _save_last_command_start
