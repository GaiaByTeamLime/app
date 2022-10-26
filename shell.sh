#!/usr/bin/env bash

[ -n "$FLUTTER_ENV" ] && exit

# Versions
GIT_VERSION="2"
CMDLINE_TOOLS_VERSION="8512546_latest"
OPENJDK_JAVA_GITHUB_RELASE_VERSION="11.0.15+10"
OPENJDK_JAVA_VERSION="11.0.15_10"
OPENJDK_JAVA_VERSION_MAJOR="11"
ANDROID_SDK_VERSION="29"
ANDROID_BUILD_TOOLS_VERSION="28.0.3"
FLUTTER_VERSION="3.0.1-stable"

# Create installation folder
mkdir -p .tools/opt .tools/bin/{sdk,android} .tools/tmp 2>&1 > /dev/null

# Testing for dependencies.
for cmd in bash curl file git mkdir rm unzip which xz zip whereis tar yes; do
	[ -z "$(command -v $cmd)" ] && {
		echo "You're missing required dependency $cmd." 
		exit 1
	}
done

[ $(git --version | cut -d \  -f 3 | cut -d . -f 1) -lt $GIT_VERSION ] && {
	echo "Git version has to be higher or equal to $GIT_VERSION.0.0"
	exit 1
}

whereis libGLU.so.1 > /dev/null || { 
	echo "You need libGLU.so.1, install libglu1-mesa on Ubuntu/Debian and mesa-libGLU on Fedora"
	exit 1 
}

# Install Java
if [ ! -d ".tools/bin/jdk-$OPENJDK_JAVA_GITHUB_RELASE_VERSION/bin" ]; then
	echo "[-] Downloading java"
	curl \
		-L -C "-" -o ".tools/tmp/java-$OPENJDK_JAVA_VERSION.tar.gz" \
		"https://github.com/adoptium/temurin${OPENJDK_JAVA_VERSION_MAJOR}-binaries/releases/download/jdk-$OPENJDK_JAVA_GITHUB_RELASE_VERSION/OpenJDK${OPENJDK_JAVA_VERSION_MAJOR}U-jdk_x64_linux_hotspot_$OPENJDK_JAVA_VERSION.tar.gz"

	echo "[-] Extracting java"
	tar \
		-x -f ".tools/tmp/java-$OPENJDK_JAVA_VERSION.tar.gz" \
		-C .tools/bin --checkpoint=.1000
	echo
fi

export PATH="$PWD/.tools/bin/jdk-$OPENJDK_JAVA_GITHUB_RELASE_VERSION/bin:$PATH"
export JAVA_HOME="$PWD/.tools/bin/jdk-$OPENJDK_JAVA_GITHUB_RELASE_VERSION"

export ANDROID_HOME="$PWD/.tools/bin/sdk"

# Install cmdline-tools
if [ ! -d ".tools/bin/sdk/cmdline-tools/latest/bin" ]; then
	echo "[-] Downloading cmdline-tools"
	curl \
		-C "-" -o ".tools/tmp/commandlinetools-linux-$CMDLINE_TOOLS_VERSION.zip" \
		"https://dl.google.com/android/repository/commandlinetools-linux-$CMDLINE_TOOLS_VERSION.zip"

	echo "[-] Extracting cmdline-tools"
	unzip \
		".tools/tmp/commandlinetools-linux-$CMDLINE_TOOLS_VERSION.zip" \
		-d ".tools/tmp/commandlinetools"

	yes y | .tools/tmp/commandlinetools/cmdline-tools/bin/sdkmanager --install "cmdline-tools;latest" --sdk_root=".tools/bin/sdk"
fi

export ANDROID_SDK_ROOT="$PWD/.tools/bin/sdk"


# Install android tools using sdkmanager
[ ! -d ".tools/bin/sdk/build-tools" ] && 
	.tools/tmp/commandlinetools/cmdline-tools/bin/sdkmanager --sdk_root=".tools/bin/sdk" --install "build-tools;$ANDROID_BUILD_TOOLS_VERSION"

[ ! -d ".tools/bin/sdk/platform-tools" ] && 
	.tools/tmp/commandlinetools/cmdline-tools/bin/sdkmanager --sdk_root=".tools/bin/sdk" --install "platform-tools"

[ ! -d ".tools/bin/sdk/platforms/android-$ANDROID_SDK_VERSION" ] && {
	sdkmanager --sdk_root=".tools/bin/sdk" --install "platforms;android-$ANDROID_SDK_VERSION"
}

export PATH="$PWD/.tools/bin/sdk/cmdline-tools/latest/bin:$PATH"
export PATH="$PWD/.tools/bin/sdk/platform-tools:$PATH"


# Install flutter
if [ ! -d ".tools/bin/flutter/bin" ]; then
	echo "[-] Downloading flutter"
	curl \
		-C "-" -o ".tools/tmp/flutter-$FLUTTER_VERSION.tar.xz" \
		"https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$FLUTTER_VERSION.tar.xz"

	echo "[-] Extracting flutter"
	tar \
		-x -f ".tools/tmp/flutter-$FLUTTER_VERSION.tar.xz" \
		-C .tools/bin --checkpoint=.1000
	echo

	rm -rf ".tools/tmp/flutter-$FLUTTER_VERSION.tar.xz"
	
	echo "[-] Precaching things"
	.tools/bin/flutter/bin/flutter precache
	.tools/bin/flutter/bin/flutter config --android-sdk "$PWD/.tools/bin/sdk"
	.tools/bin/flutter/bin/flutter config --no-analytics
	yes y | .tools/bin/flutter/bin/flutter doctor --android-licenses > /dev/null
fi

export PATH="$PWD/.tools/bin/flutter/bin:$PATH"

rm -rf ".tools/tmp/{*,.*}"

RCFILE=".$(basename $SHELL)rc"
cp $HOME/$RCFILE .tools/$RCFILE || echo > .tools/$RCFILE
chmod 644 .tools/$RCFILE
cat <<BASHRC >> .tools/$RCFILE
	export FLUTTER_ENV=true
	export ANDROID_SDK_ROOT="$PWD/.tools/bin/sdk"
	export ANDROID_HOME="$PWD/.tools/bin/sdk"
	alias sdkmanager="sdkmanager --sdk_root='$PWD/.tools/bin/sdk'"

	echo -e ""
	echo -e "    Welcome to the \x1b[36;1m⚛ flutter\x1b[0m environment!"
	echo -e ""
	echo -e "    - Use \x1b[1m./emulator.sh\x1b[0m to launch an emulator"
	echo -e "    - To start the app run \x1b[1m./start.sh\x1b[0m"
	echo -e ""
BASHRC

if [ "x$1" = "x" ]; then
	case $SHELL in
		*zsh*) ZDOTDIR="$PWD/.tools" $SHELL  -i ;;
		*) $SHELL --init-file "$PWD/.tools/$RCFILE" -i ;;
	esac
else
	case $SHELL in
		*zsh*) ZDOTDIR="$PWD/.tools" $SHELL -c "${@}" ;;
		*) $SHELL --init-file "$PWD/.tools/$RCFILE" -c "${@}" ;;
	esac
fi


