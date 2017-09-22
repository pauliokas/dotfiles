function gw {
	base_dir=$(print -l (../)#gradlew(:h) | head -1)
	$base_dir/gradlew --build-file $base_dir/build.gradle $@
}

