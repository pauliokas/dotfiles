function boop() {
  local exit_code="$?"
  if [[ "$exit_code" == "0" ]];
  then afplay /System/Library/Sounds/Glass.aiff
  else afplay /System/Library/Sounds/Sosumi.aiff
  fi
  return "$exit_code"
}
