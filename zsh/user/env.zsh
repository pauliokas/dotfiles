export EDITOR='vim'

if [[ -d "${HOME}/bin" ]]; then
	export PATH="${HOME}/bin:${PATH}"
fi

export ANDROID_SDK_ROOT="${HOME}/.android/Sdk"
