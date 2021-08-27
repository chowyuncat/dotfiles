#!/usr/bin/env bash

### Finder
# Finder: show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder
# Don't create .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true


### Spotlight
# Disable the default cmd+space hotkey to open Spotlight
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c \
    "Set AppleSymbolicHotKeys:64:enabled false"


### Keyboard
# Lower delay before first key repeat
defaults write NSGlobalDomain InitialKeyRepeat 25
defaults write NSGlobalDomain KeyRepeat -int 1

# Allow full keyboard navigation of all UI controls
# Note: this value is 2 in Yosemite (and higher?), but 2 in older versions of OS X
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2


### Scrollbars
# Global: Always show scrollbars
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Global: Scrollbar click jumps to location, rather than next page
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 1


### Trackpad
if false; then
# Trackpad sensitivity
# Requires system restart[1]
defaults write NSGlobalDomain com.apple.trackpad.scaling 0.875
fi

# Scroll unnaturally
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false


# Gesture to show application windows
# Requires Dock restart
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

# Set top-level corner to put display to sleep
defaults write com.apple.dock.plist "wvous-tl-corner" -int 10
# Set top-level corner to require shift held down
defaults write com.apple.dock.plist "wvous-tl-modifier" -int 131072

# [1] @TODO: investigate restart of a service instead
