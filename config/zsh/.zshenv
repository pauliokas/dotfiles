# Only source this once
if [[ -n "$__ZSH_VARS_SOURCES" ]]; then return; fi
export __ZSH_VARS_SOURCES=1

if [ -e /opt/homebrew/bin/brew ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
    export HOMEBREW_NO_INSTALL_CLEANUP="1"
fi
