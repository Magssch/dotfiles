# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Dock: Increase dock show / hide speed
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.15
killall Dock
# Set right command as backspace key
sudo defaults write com.apple.loginwindow LoginHook `pwd`/loginscriptbackspace.sh