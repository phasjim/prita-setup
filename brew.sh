#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update
# Tap bundle and install mas-cli
brew tap homebrew/bundle
brew install mas
# Unpack brew bundle
brew bundle

# Export gnu utils path
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Remove outdated versions from the cellar.
brew cleanup

# echo "Open Sublime Text and install Package Control."
