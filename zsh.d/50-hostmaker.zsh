function hostmaker-aws {
	aws-mfa --profile=hostmaker --short-term-suffix=2fa --token="$(1psw get totp 'AWS - Hostmaker')"
	export AWS_PROFILE=hostmaker-staging
}
export ANDROID_HOME="$HOME/.android/Sdk"
export JAVA_HOME="/usr/lib/jvm/default"
