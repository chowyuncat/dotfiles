#!/bin/bash
APPNAP_DISABLED=$(defaults read sshd NSAppSleepDisabled)
if [ $APPNAP_DISABLED != 1 ]; then
	echo "Disabling App Nap for ssh"
	defaults write sshd NSAppSleepDisabled -bool YES
fi
