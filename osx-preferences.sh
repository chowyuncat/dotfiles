# Finder: sow hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true


# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Global: Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Don't create .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Allow full keyboard navigation of all UI controls
# Note: this value is 2 in Yosemite (and higher?), but 2 in older versions of OS X
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
