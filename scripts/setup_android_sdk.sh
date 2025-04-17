if [ -d "$HOME/android-sdk" ]; then
  echo 'Android SDK already set up (~/android-sdk folder exists!)'
else
  echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))" >> ~/.bashrc
  echo "export ANDROID_HOME=\$HOME/android-sdk" >> ~/.bashrc
  echo "export ANDROID_SDK_HOME=\$ANDROID_HOME/cmdline-tools/latest/bin" >> ~/.bashrc
  echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$ANDROID_SDK_HOME:\$ANDROID_HOME/platform-tools:\$ANDROID_HOME/emulator:\$PATH" >> ~/.bashrc
  echo "Installing Android SDK"
  sudo apt-get update
  sudo apt-get install -y wget unzip
  #wget $(curl -s https://developer.android.com/studio | grep -o 'https://dl.google.com/android/repository/commandlinetools-linux-[0-9]*_latest.zip' | head -n 1)
  wget $(curl -s https://developer.android.com/studio | grep -o 'https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip' | head -n 1)
  mkdir -p $HOME/android-sdk/cmdline-tools
  unzip commandlinetools-linux-*_latest.zip -d $HOME/android-sdk/cmdline-tools
  rm commandlinetools-linux-*_latest.zip
  mv $HOME/android-sdk/cmdline-tools/cmdline-tools $HOME/android-sdk/cmdline-tools/latest
  export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
  export ANDROID_HOME=$HOME/android-sdk
  export ANDROID_SDK_HOME=$ANDROID_HOME/cmdline-tools/latest/bin
  export PATH=$PATH:$JAVA_HOME/bin:$ANDROID_SDK_HOME:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH

  echo 'Installing SDK components...'
  yes | sdkmanager --sdk_root=$ANDROID_HOME --licenses
  sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "platforms;android-31" "emulator" "system-images;android-31;google_apis;x86_64"

  echo 'creating AVD...'
  if emulator -list-avds | grep -q "test_avd"; then
    echo 'AVD with name test_avd already exists... delete test_avd'
    avdmanager delete avd -n test_avd
  fi
  echo 'create new AVD'
  echo "no" | avdmanager create avd -n test_avd -k "system-images;android-31;google_apis;x86_64"
fi
echo 'You can start the emulator by typping...'
echo 'emulator -avd test_avd -no-window -no-audio -no-boot-anim -gpu off -no-snapshot-load'
