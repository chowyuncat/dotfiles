#!/bin/bash
set -e
set -u

if [ "${1}" == 'dim' ]; then
    key_code=145
elif [ "${1}" == 'bright' ]; then
    key_code=144
fi

for i in $(seq 0 20); do
    osascript -e 'tell application "System Events"' -e "key code ${key_code}" -e ' end tell'
done

