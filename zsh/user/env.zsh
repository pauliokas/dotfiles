export EDITOR='vim'
export PIP_REQUIRE_VIRTUALENV=true

if [[ -d "${HOME}/bin" ]]; then
	export PATH="${HOME}/bin:${PATH}"
fi

