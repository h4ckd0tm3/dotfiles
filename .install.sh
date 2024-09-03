#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

## Formulae
echo "Installing Brew Formulae..."
### Essentials
brew install gsl
brew install llvm
brew install boost
brew install libomp
brew install armadillo
brew install wget
brew install jq
brew install ripgrep
brew install bear
brew install mas
brew install gh
brew install ifstat
brew install switchaudio-osx
brew install skhd
brew install sketchybar
brew install borders

### Terminal
brew install zoxide

### Nice to have
brew install lulu
brew install btop
brew install svim
brew install lazygit
brew install wireguard-go
brew install virtualenvwrapper

### Get back the real nano
brew install nano
brew unlink nano && brew link nano

### IDE's
brew install --cask -f pycharm
brew install --cask -f goland

### Docker
brew install --cask -f docker

### Custom HEAD only forks
brew install fyabai --head
brew install fnnn --head # nnn fork (changed colors, keymappings)

## Casks
echo "Installing Brew Casks..."
### Terminals & Browsers
brew install --cask -f brave-browser

### Pentest
brew install --cask -f burp-suite

### Messenger
brew install --cask -f discord
brew install --cask -f signal
brew install --cask -f telegram
brew install --cask -f whatsapp
brew install --cask -f readdle-spark # E-Mail

### Reversing
brew install --cask -f machoview
brew install --cask -f hex-fiend

### Nice to have
brew install --cask -f alfred
brew install --cask -f spotify
brew install --cask -f visual-studio-code

### Fonts
brew install --cask -f sf-symbols
brew install --cask -f font-hack-nerd-font
brew install --cask -f font-jetbrains-mono
brew install --cask -f font-fira-code

# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 1451685025 #Wireguard
mas install 497799835 #xCode

# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write com.apple.dock "orientation" -string "right"
defaults write com.apple.dock "tilesize" -int "36"
defaults write com.apple.dock "static-only" -bool "true"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"
defaults write NSGlobalDomain AppleAccentColor -int 1
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write -g NSWindowShouldDragOnGesture YES

## Fix for MX Master 3S
sudo defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid

# Copying and checking out configuration files
echo "Planting Configuration Files..."
[ ! -d "$HOME/dotfiles" ] && git clone --bare git@github.com:h4ckd0tm3/dotfiles.git $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout master

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.5/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Installing helix language server
git clone https://github.com/estin/simple-completion-language-server.git /tmp/simple-completion-language-server
(cd /tmp/simple-completion-language-server && cargo install --path .)
rm -rf /tmp/simple-completion-language-server


# Start Services
echo "Starting Services (grant permissions)..."
brew services start skhd
brew services start yabai
brew services start sketchybar
brew services start borders
brew services start svim

echo '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' > /private/etc/sudoers.d/yabai
echo "Installation complete... Reboot please :)\n"