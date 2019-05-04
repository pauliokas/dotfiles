export EDITOR='vim'

if [[ -d "${HOME}/bin" ]]; then
	export PATH="${HOME}/bin:${PATH}"
fi

if [[ -d "${HOME}/.local/bin" ]]; then
	export PATH="${HOME}/.local/bin:${PATH}"
fi

export ANDROID_SDK_ROOT="${HOME}/.android/Sdk"

