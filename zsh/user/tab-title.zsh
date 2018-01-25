precmd() {
  relevant_path=$(echo ${PWD/#$HOME/\~} | rev | cut -d'/' -f1-3 | rev)
  echo -ne "\033]0;${relevant_path}\007"
}
