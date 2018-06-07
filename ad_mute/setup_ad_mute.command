#!/bin/bash

MY_PATH="`dirname \"$0\"`" 
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$MY_PATH" ] ; then
  exit 1
fi

if [ ! -d "/Users/$USER/Library/Services/" ]; then
  echo "Nope. This isn't going to work. Error1."
  exit 1
fi

if [ ! -d "$MY_PATH/ad_mute.workflow" ]; then
  echo "Nope. This isnt going to work. Error2."
  exit 1
fi

cp -rf $MY_PATH/ad_mute.workflow /Users/$USER/Library/Services/ad_mute.workflow

osascript -e 'tell application "System Preferences"' -e 'activate' -e 'set the current pane to pane id "com.apple.preference.keyboard"' -e 'get the name of every anchor of pane id "com.apple.preference.keyboard"' -e 'reveal anchor "shortcutsTab" of pane id "com.apple.preference.keyboard"' -e 'end'

echo -n -e "\033]0;setup_ad_mute\007"
osascript -e 'tell application "Terminal" to close (every window whose name contains "setup_ad_mute")' & exit
