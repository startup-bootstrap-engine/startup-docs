# Android Environment Setup

The following script will prepare your environment to run allow you to build android apps.

```bash
#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to determine the shell configuration file
get_shell_config() {
    if [ -n "$ZSH_VERSION" ]; then
        echo "$HOME/.zshrc"
    else
        echo "$HOME/.bashrc"
    fi
}

# Determine which shell configuration file to use
SHELL_CONFIG=$(get_shell_config)

echo "Using shell configuration file: $SHELL_CONFIG"

# Step 1: Install Java 17
echo "=== Step 1: Installing Java 17 ==="

echo "Updating package list..."
sudo apt-get update

echo "Installing OpenJDK 17..."
sudo apt-get install -y openjdk-17-jdk

echo "Configuring Java 17 as the default version..."
sudo update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-17-openjdk-amd64/bin/javac

# Set JAVA_HOME environment variable
JAVA_HOME_PATH="/usr/lib/jvm/java-17-openjdk-amd64"
echo "Setting JAVA_HOME to $JAVA_HOME_PATH in $SHELL_CONFIG..."

# Check if JAVA_HOME is already set
if ! grep -q "JAVA_HOME" "$SHELL_CONFIG"; then
    echo "export JAVA_HOME=$JAVA_HOME_PATH" >> "$SHELL_CONFIG"
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> "$SHELL_CONFIG"
    echo "JAVA_HOME and PATH updated in $SHELL_CONFIG."
else
    echo "JAVA_HOME is already set in $SHELL_CONFIG. Skipping update."
fi

# Apply the changes to the current session
echo "Applying environment changes..."
source "$SHELL_CONFIG"

# Verify Java installation
echo "Verifying Java installation..."
java -version

echo "Java 17 installation and configuration complete."
echo ""

# Step 2: Install Android SDK
echo "=== Step 2: Installing Android SDK ==="

# Variables
ANDROID_HOME="$HOME/Android"
CMDLINE_TOOLS_ZIP="commandlinetools-linux_latest.zip"
CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip"

echo "Creating Android SDK directories at $ANDROID_HOME..."
mkdir -p "$ANDROID_HOME/cmdline-tools"

cd "$HOME"

echo "Downloading Android command-line tools..."
wget -q --show-progress "$CMDLINE_TOOLS_URL" -O "$CMDLINE_TOOLS_ZIP"

echo "Extracting command-line tools..."
unzip -q "$CMDLINE_TOOLS_ZIP" -d "$ANDROID_HOME/cmdline-tools"

# Move the tools to 'latest' directory
echo "Organizing command-line tools..."
mkdir -p "$ANDROID_HOME/cmdline-tools/latest"
mv "$ANDROID_HOME/cmdline-tools"/cmdline-tools/* "$ANDROID_HOME/cmdline-tools/latest/"

# Clean up the downloaded zip file
echo "Cleaning up downloaded files..."
rm "$CMDLINE_TOOLS_ZIP"

# Set ANDROID_HOME and update PATH
echo "Setting ANDROID_HOME and updating PATH in $SHELL_CONFIG..."

# Check if ANDROID_HOME is already set
if ! grep -q "ANDROID_HOME" "$SHELL_CONFIG"; then
    echo "export ANDROID_HOME=$ANDROID_HOME" >> "$SHELL_CONFIG"
    echo 'export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH' >> "$SHELL_CONFIG"
    echo 'export PATH=$ANDROID_HOME/platform-tools:$PATH' >> "$SHELL_CONFIG"
    echo "ANDROID_HOME and PATH updated in $SHELL_CONFIG."
else
    echo "ANDROID_HOME is already set in $SHELL_CONFIG. Skipping update."
fi

# Apply the changes to the current session
echo "Applying environment changes..."
source "$SHELL_CONFIG"

echo "Android SDK installation complete."
echo ""

# Step 3: Install Required Android SDK Components
echo "=== Step 3: Installing Required Android SDK Components ==="

echo "Updating sdkmanager..."
sdkmanager --update

echo "Accepting all Android SDK licenses..."
yes | sdkmanager --licenses

echo "Installing platform-tools, platforms;android-34, build-tools;30.0.3, and emulator..."
sdkmanager --install "platform-tools" "platforms;android-34" "build-tools;30.0.3" "emulator"

echo "Android SDK components installation complete."
echo ""

# Step 4: Verify Installation
echo "=== Step 4: Verifying Installation ==="

echo "Verifying Java version..."
java -version

echo "Verifying Android SDK installation by listing installed packages..."
sdkmanager --list_installed

echo "Android development environment setup is complete!"
echo ""
echo "Please restart your terminal or run 'source $SHELL_CONFIG' to apply environment changes."

# Optional: Build Your Project
# Uncomment the lines below and set PROJECT_DIR to your project directory if you want the script to clean and build your project automatically.

# PROJECT_DIR="/path/to/your/project"
# echo "=== Optional: Cleaning and Building Your Project ==="
# echo "Navigating to project directory: $PROJECT_DIR"
# cd "$PROJECT_DIR"
# echo "Cleaning the project..."
# ./gradlew clean
# echo "Building the project..."
# ./gradlew assembleRelease
# echo "Project build complete."

```
