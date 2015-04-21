#!/bin/bash
[[ "$(uname -s)" != "Darwin" ]] && exit 0

main() {
  defaults write com.googlecode.iterm2 PromptOnQuit -bool false
  defaults write com.googlecode.iterm2 DimInactiveSplitPanes 0
  defaults write com.googlecode.iterm2 ShowFullScreenTabBar 1

  local theme=/tmp/base16-ocean.dark.itermcolors
  rm -rf $theme
  curl -o $theme \
    "https://raw.githubusercontent.com/chriskempson/base16-iterm2/master/base16-ocean.dark.itermcolors"
  #open /tmp/base16-ocean.dark.itermcolors
  #sleep 1
  local plist="$HOME/Library/Preferences/com.googlecode.iterm2.plist"
  grep key $theme | cut -d'>' -f2 | cut -d'<' -f1 | while read key; do
    $buddy -c "Delete :'New Bookmarks':0:'$key'" "$plist" 2>/dev/null || true
  done
  /usr/libexec/PlistBuddy -c \
    "Set 'New Bookmarks':0:'Terminal Type' 'xterm-256color'" "$plist"

  /usr/libexec/PlistBuddy -c \
    "Set 'New Bookmarks':0:'Non Ascii Font' 'Menlo-Regular 14'" "$plist"
  /usr/libexec/PlistBuddy -c \
    "Set 'New Bookmarks':0:'Normal Font' 'Menlo-Regular 14'" "$plist"

  /usr/libexec/PlistBuddy -c \
    "Set 'New Bookmarks':0:'Use Bold Font' '0'" "$plist"
  /usr/libexec/PlistBuddy -c \
    "Set 'New Bookmarks':0:'Horizontal Spacing' '0.9'" "$plist"
  /usr/libexec/PlistBuddy -c \
    "Set 'New Bookmarks':0:'Vertical Spacing' '0.9'" "$plist"

  /usr/libexec/PlistBuddy -c "Merge '$theme' :'New Bookmarks':0" "$plist"
}

main
