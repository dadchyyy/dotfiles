# Finder
# Always show hidden files.
defaults write com.apple.finder AppleShowAllFiles TRUE
# Show absolute path.
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true
# Ralaunch Finder.
killall Finder

# Keyboard
# Increase initial key repeat rate (gui minimum is 15).
defaults write -g InitialKeyRepeat -int 12
# Increase Key repeat rate (gui minimum is 2).
defaults write -g KeyRepeat -int 1

# Dock
# Automatically hide the Dock.
defaults write com.apple.dock autohide -bool true
# Only show active apps.
defaults write com.apple.dock static-only -boolean true
# Relaunch Dock.
killall Dock
