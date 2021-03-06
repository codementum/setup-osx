#!/bin/zsh

LIB=$HOME/Library
APP_SUPPORT=$LIB/Application\ Support


# XCode command line tools should be installed first
if [ ! -d /usr/llvm-gcc-4.2 ]; then
  echo 'Install XCode command line tools first.'
  echo 'Choose Xcode > Preferences and select the Downloads tab. Under the Components sub-tab, click the Install button next to the "Command Line Tools" entry in the table'
  exit 0
fi

#################################################################
# Install tools
#################################################################

# install [brew](http://mxcl.github.com/homebrew/)
if [ ! -x /usr/local/bin/brew ]; then
  ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
fi

# install [git](http://git-scm.com/)
if [ ! -x /usr/local/bin/git ]; then
  brew install git
fi

# install [zsh](http://www.zsh.org/)
if [ ! -x /usr/local/bin/zsh ]; then
  brew install zsh
fi

# install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
if [ ! -d $HOME/.oh-my-zsh ]; then
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# install [node](http://nodejs.org/)
if [ ! -x /usr/local/bin/node ]; then
  brew install node
fi

if [ ! -h /usr/local/share/npm/bin/jshint ]; then
  npm install -g jshint
fi

if [ ! -h /usr/local/share/npm/bin/jsonlint ]; then
  npm install -g jsonlint
fi

# install python
if [ ! -x /usr/local/bin/python ]; then
  brew install python
  /usr/local/bin/pip install --upgrade distribute
  /usr/local/bin/pip install --upgrade pip
fi

# install [rvm](https://rvm.io/)
if [ ! -x $HOME/.rvm/bin/rvm ]; then
  \curl -L https://get.rvm.io | bash -s stable --ruby
fi


#################################################################
# Symlink dot files/dirs from here into home directory
#################################################################

for i in `ls -Ad dotfiles/.*` ; do
  ln -s -f `pwd`/$i $HOME
done

# ssh config
ln -s -f `pwd`/ssh/config $HOME/.ssh/config

# symlink the bin directory into home
ln -s -f `pwd`/bin $HOME


#################################################################
# Application Configurations - symlinks from here
#################################################################

# [Chrome](https://chrome.google.com) web inspector css
ln -s -f `pwd`/mac/apps/Chrome/Custom.css $APP_SUPPORT/Google/Chrome/Default/User\ StyleSheets/Custom.css

# [OmniGraffle](https://www.omnigroup.com/products/omnigraffle/) [stencils](http://graffletopia.com/) and templates
ln -s -f -F `pwd`/mac/apps/OmniGraffle $APP_SUPPORT

# sublime
STPKG=$APP_SUPPORT/Sublime\ Text\ 2/Packages
if [ ! -d $STPKG ]; then
  mkdir -p $STPKG
fi
if [ -d $STPKG/User ]; then
  mv $STPKG/User $STPKG/User-original
fi
ln -s -f -F `pwd`/mac/apps/sublime/User $STPKG

# [Marked](http://markedapp.com/)
ln -s -f -F `pwd`/mac/apps/Marked $APP_SUPPORT


#################################################################
# System Configurations - symlinks from here
#################################################################

# colors - remove the directories if it is a system installed dir
if [ -d $LIB/Colors -a ! -h $LIB/Colors ]; then
  echo 'Sudo needed to move Colors directory to Trash'
  sudo mv $LIB/Colors ~/.Trash
fi
ln -s -f -F `pwd`/mac/Colors $LIB

# quicklook
ln -s -f -F `pwd`/mac/QuickLook $LIB

# applescripts
ln -s -f -F `pwd`/mac/Scripts $LIB

# services
ln -s -f -F `pwd`/mac/Services $LIB

## Note: permission denied if you try to link the whole ColorPickers folder
ln -s -f -F `pwd`/mac/ColorPickers/HexColorPicker.colorPicker $LIB/ColorPickers


#################################################################
# System Fonts
# Get fonts from http://www.fontsquirrel.com/fonts/
#################################################################

cd $LIB/Fonts
\curl -LO http://www.fontsquirrel.com/fonts/download/Anonymous-Pro && unzip Anonymous-Pro && rm Anonymous-Pro
\curl -LO http://www.fontsquirrel.com/fonts/download/Inconsolata && unzip Inconsolata && rm Inconsolata
\curl -LO http://www.fontsquirrel.com/fonts/download/source-code-pro && unzip source-code-pro && rm source-code-pro
\curl -LO http://www.fontsquirrel.com/fonts/download/architects-daughter && unzip architects-daughter && rm architects-daughter
\curl -LO http://www.fontsquirrel.com/fonts/download/Daniel && unzip Daniel && rm Daniel
mv *.txt ~/.Trash/


#################################################################
# Set up OS X defaults
# Many of these come from: http://mths.be/dotfiles
#################################################################


# be quiet on login
touch ~/.hushlogin

#################################################################
# General UI/UX                                                 #
#################################################################

# Menu bar: disable transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

# Menu bar: hide the useless Time Machine and Volume icons
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
  
# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input   #
#################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Enable access for assistive devices
echo 'Requesting password to enable access for assistive devices'
echo -n 'a' | sudo tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1
sudo chmod 444 /private/var/db/.AccessibilityAPIEnabled

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true
# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300


#################################################################
# Screen                                                        #
#################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

  
#################################################################
# Finder                                                        #
#################################################################

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  
# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show item info below desktop icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for desktop icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# Use column view in all Finder windows by default
# Four-letter codes for the  view modes: `icnv`, `clmv`, `Flwv`, `Nlsv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
chflags nohidden ~/Library
  

#################################################################
# Dock                                                          #
#################################################################

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilte-stack -bool true

# Set the icon size of Dock items to 32 pixels
defaults write com.apple.dock tilesize -int 32

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don't animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Remove the auto-hiding Dock delay
defaults write com.apple.Dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Enable the 2D Dock
defaults write com.apple.dock no-glass -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Reset Launchpad
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete

# Hot corners
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

  
#################################################################
# Safari/webkit                                                 #
#################################################################

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Disable Safari's thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari's debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

  
#################################################################
# Dashboard                                                     #
#################################################################

# Turn the dashboard off completely
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock "dashboard-in-overlay" -bool true


#################################################################
# iTunes                                                        #
#################################################################

# Make the iTunes arrow links go to your library instead of the iTunes Store
defaults write com.apple.iTunes invertStoreLinks -bool true

# Disable the iTunes arrow links completely
defaults write com.apple.iTunes show-store-arrow-links -bool false

# Disable the Ping sidebar in iTunes
defaults write com.apple.iTunes disablePingSidebar -bool true

# Disable all the other Ping stuff in iTunes
defaults write com.apple.iTunes disablePing -bool true
  

#################################################################
# Mail                                                          #
#################################################################

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
  

#################################################################
# Time Machine                                                  #
#################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


#################################################################
# Google Chrome & Google Chrome Canary                          #
#################################################################

# Allow installing user scripts via GitHub or Userscripts.org
defaults write com.google.Chrome ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"
defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"


#################################################################
# Twitter.app                                                   #
#################################################################

# Disable smart quotes as it’s annoying for code tweets
defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# Show the app window when clicking the menu icon
defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

# Enable the hidden ‘Develop’ menu
defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

# Open links in the background
defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# Allow closing the ‘new tweet’ window by pressing `Esc`
defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# Show full names rather than Twitter handles
#defaults write com.twitter.twitter-mac ShowFullNames -bool true

# Hide the app in the background if it’s not the front-most window
defaults write com.twitter.twitter-mac HideInBackground -bool true

  
  
# Reset the affected apps
for app in Finder Dock Mail Safari iTunes SystemUIServer Twitter; do
	killall "$app" > /dev/null 2>&1
done
