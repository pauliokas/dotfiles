function hostmaker-aws {
	aws-mfa --profile=hostmaker --short-term-suffix=2fa --long-term-suffix=none
	export AWS_PROFILE=hostmaker-staging
}
export ANDROID_HOME="$HOME/.android/Sdk"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
