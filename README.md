# david's macOS Setup Guide

Blatantly stealing the idea from Kevin Elliott's [El Capitan Guide](https://gist.github.com/kevinelliott/e12aa642a8388baf2499), I've decided to document as much as I can of my new computer setup guide. There's a lot to do when refreshing a computer or setting one up from scratch, but a bit of planning reduces a ton of pain later on. :relaxed:

If there are steps that you've noticed that I'm clearly missing, please let me know. If you want to fork this guide to make your own, go right ahead!



## Before Reformat

I generally am doing this because I'm reformatting an old computer because I have a problem (usually the computer, always me). I sometimes forget that there are more than files to backup, since not everything syncs perfectly. Here's what I need to remember to sync and where they live.

- Calibre - Library is saved in user files, backup from computer
- Chrome - OneTab should be bookmarked, and the rest Chrome syncs itself
- Firefox - Firefox syncs itself, sync extensions like Privacy Badger manually
- iTerm2 - Syncing preferences to Dropbox
- Sublime Text Preferences - PackageSync creates a zip for me. Save current workspace as well to Dropbox
- Transmit Favorites - Must be manually synced for me using their export tool, or use Panic Sync
- VS Code - 


## Install Basic Software

This is the software that I use on a very regular basis. Not all software is listed, as this would be one of the most time consuming to keep up to date.

### Install from App Store/Web
- [Amphetamine](https://itunes.apple.com/us/app/amphetamine/id937984704?mt=12)
- [Pixelmator](https://itunes.apple.com/us/app/pixelmator/id407963104?mt=12)
- [VS Code](https://code.visualstudio.com/download)
- [Logi Options+](https://www.logitech.com/en-us/software/logi-options-plus.html)
- [Monitor Control](https://github.com/MonitorControl/MonitorControl)
- [Better Display](https://github.com/waydabber/BetterDisplay)

### Homebrew

##### Install Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

##### Install Homebrew extension Cask

```
brew tap homebrew/cask-fonts
```

##### Install common applications via Homebrew
_Yes, you can run this all as one `brew install` command followed by the list of applications, but some require additional input or could have other issues installing, so I run them separately to give an easy way to continue if needed_

```
brew install arp-scan
brew install bat
brew install blueutil
brew install cmake
brew install fd
brew install ffmpeg
brew install freeglut
brew install fzf
brew install gh
brew install ghostscript
brew install gifsicle
brew install git
brew install grep
brew install highlight
brew install htop
brew install imagemagick
brew install imageoptim-cli
brew install jpegoptim
brew install mackup
brew install markdown
brew install mupdf
brew install ncdu
brew install nmap
brew install noti
brew install openjdk
brew install optipng
brew install oxipng
brew install pandoc
brew install php
brew install phplint
brew install pipenv
brew install pngcrush
brew install pngquant
brew install prettyping
brew install subversion
brew install vim
brew install webtorrent-cli
brew install wget
brew install wp-cli
brew install wp-cli-completion
brew install youtube-dl
brew install zsh
brew install zsh-completions
brew install zsh-syntax-highlighting
brew install zopfli
```

##### Install applications via Homebrew Cask

Seriously, barring the insertion of malicious code or lack of checksums (two things which should honestly scare me away of many), Cask is pretty useful. I'm choosing to be willfully ignorant, since broadcasting usage opens me up anyway, and this saves a lot of time.

```
brew install 1password
brew install 1password-cli
brew install adoptopenjdk
brew install alfred
brew install audacity
brew install calibre
brew install cleanmymac
brew install devonthink
brew install discord
brew install dropbox
brew install firefox-developer-edition
brew install font-hack
brew install font-hack-nerd-font
brew install font-roboto
brew install font-roboto-mono
brew install font-source-code-pro
brew install google-chrome
brew install imageoptim
brew install inky
brew install iterm2
brew install local
brew install obsidian
brew install rectangle
brew install telegram
brew install temurin
brew install the-unarchiver
brew install transmit
brew install twine
brew install vlc
brew install xnviewmp

// Some of my maybe installs
brew install arduino
brew install balenaetcher
brew install qlcolorcode
brew install qlmarkdown
brew install qlprettypatch
brew install quicklook-csv
brew install quicklook-json
brew install sequel-pro
brew install steam
brew install sublime-text
brew install webpquicklook
```

### Additional Command Line Installs
#### NPM Tools
```
npm install -g alex
npm install -g csslint
npm install -g eslint
npm install -g eslint-config-wordpress
npm install -g --save-dev eslint-plugin-prettier
npm install -g --save-dev --save-exact prettier
npm install -g gulp-cli
npm install -g how-2
npm install -g imageoptim-cli
npm install -g markdownlint-cli
npm install -g prettier
npm install -g prettier-stylelint
npm install -g @wordpress/prettier-config --save-dev
npm install -g stylelint
npm install -g stylelint-config-standard
npm install -g stylelint-config-wordpress
npm install -g stylelint-order
npm install -g textlint
npm install -g textlint-rule-alex
npm install -g textlint-rule-common-misspellings
npm install -g textlint-rule-diacritics
npm install -g textlint-rule-en-max-word-count
npm install -g textlint-rule-en-spell
npm install -g textlint-rule-no-dead-link
npm install -g textlint-rule-no-start-duplicated-conjunction
npm install -g textlint-rule-rousseau
npm install -g textlint-rule-stop-words
npm install -g textlint-rule-terminology
npm install -g @textlint-rule/textlint-rule-no-unmatched-pair
npm install -g @textlint-rule/textlint-rule-require-header-id
npm install -g undollar
```

#### Composer Tools
```
composer global require squizlabs/php_codesniffer
composer global require wp-coding-standards/wpcs
composer global require overtrue/phplint
composer global require friendsofphp/php-cs-fixer
```

#### Oh My ZSH!
- Install a fancy zsh framework for funtimes
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
- Make zsh the default shell for the current user with `chsh -s $(which zsh)`
- Setup changes to the .zshrc file to config for our usage

#### Make some aliases
My current zsh profile with my aliases is backed up with Mackup now, but just in case these are needed

_A few of these came from this post by Remy Sharp, [CLI: Improved](https://remysharp.com/2018/08/23/cli-improved) which is definitely worth checking out._
```
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git"
alias top="htop"
alias gits="git status"
alias gita="git add ."
alias gitc="git commit -m"
alias gitpom="git push -u origin main"
alias sizesort="du -d 1 -h | sort -h"
alias sizesort="du -d 1 -h | sort -h"
alias fixcamera="sudo killall VDCAssistant"
alias fixaudio="sudo kill -9 `ps ax | grep 'coreaudio[a-z]' | awk '{print $1}'`"
alias fixbluetooth="sudo rm -R /Library/Preferences/com.apple.Bluetooth.plist"
alias torrent="torrent.sh"
alias pdfcompress="_pdf_compress"
```

#### Misc Tools
- [Has](https://github.com/kdabir/has) for checking dependencies and versions
`git clone https://github.com/kdabir/has.git && cd has && make install`
- With PHPCS and WPCS installed, we've gotta tell PHPCS where to find WPCS
`phpcs --config-set installed_paths ~/.composer/vendor/wp-coding-standards/wpcs`


### Set Up Applications

- Login to Chrome & Firefox to download and setup extensions
- Login to Dropbox and get files
- Make dev files that I use open in VS Code (things like .txt, .sh, .json)
- Setup Rectangle shortcuts so they don't interfere with Firefox shortcuts
- Load existing iTerm2 .plist file from Dropbox, most likely running `killall cfprefsd` with it closed to clear the cached file
- I save custom scripts in Dropbox because I would probably lose them somehow otherwise. The files here have to be sourced, and the folder has to be added to the PATH environment variable. Both of those are accomplished with this portion of my `.zshrc` file:
```
# Add my scripts folder to the path
PATH=$PATH:~/Dropbox/scripts
# Source stuff!
source ~/.zshrc

for f in ~/Dropbox/scripts/zsh/*; do
	if [[ $file == *.sh ]]
	then
		source "$f"
	fi
done
```


### Sublime Text 3 (outdated)
- License Sublime Text and SFTP (license and instructions in email)
- Symlink so I can open files in Sublime from the command line
```
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
```
- Setup fzf to open the previewed file in Sublime Text 3 with ctrl+O shortcut
```
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
```

The below are currently negated by my use of PackageSync and Mackup, but for reference:
- Install Package Control by opening Sublime Text, opening the command prompt with ctrl+`, and entering the installation script. It can be found at https://packagecontrol.io/installation, with the most recent script being:
```
import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)

```
- Install Packages: Accessibility, ACF Snippets, Ayu Theme, BracketHighlighter, CSS Completions, Diffy, EditorConfig, Genesis, Gist,  JSLint, JSONLint, PHPCdoeBeautifier, SFTP, SidebarEnhancements, SublimeLinter, SublimeLinter-contrib-php-cs-fixer, SublimeLinter-php, SublimeLinter-phpcs, Text Pastry, WordPress Completions, WordPress Customizer

### VS Code
I've started using VS Code in part because it feels that everyone else has switched and that's where I can get updated plugins and tutorials and tooling.

One tool that I use is an SFTP uploader that needs a little fix, [found in this thread](https://github.com/liximomo/vscode-sftp/issues/919#issuecomment-838586635)
```
Do a search inside ~/.vscode/extensions/liximomo.sftp-1.12.9/node_modules/ssh2-streams/lib/sftp.js
for options.emitClose = false;

Add options.autoDestroy = false; after both instances.
```

### Gitting on with Git
- Xcode and git are installed, right?
- If so, running `xcode-select --install` will get you the prompts for the Xcode Command Line Tools
- Set some defaults up.
```
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git config --global github.user githubusername
git config --global push.default current
git config --global init.defaultBranch "main"
git config --global merge.conflictstyle diff3
git config --global core.editor "code -wait"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
```

- I'm creating a git ignore based entirely on a suggestion from Carl Alexander's [Mac Setup Post](https://carlalexander.ca/2016-macbook-pro-setup/) `vi ~/.gitignore_global`

The file consists of a wide variety of system files and packages that I never want to save to a git repo.
```
# compiled source #
###################
*.com
*.class
*.dll
*.exe
*.o
*.so

# Packages #
############
# it's better to unpack these files and commit the raw source
# git has its own built in compression methods
*.7z
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip

# Logs and databases #
######################
*.log
*.sql
*.sqlite

# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE files #
#############
/.idea
*.sublime-project
*.sublime-workspace
*.code-workspace
```

I then save that file and add it to global exclude those files:
`git config --global core.excludesfile ~/.gitignore_global`

- Check that keychain helper is installed with `git credential-osxkeychain` **Note:** if you installed git via HomeBrew, this is done for you. Skip to the `git config` step below.
- If not installed, set that sucker up.
`curl -s -O http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain`
- Modify permissions on the helper so it can operate
`chmod u+x git-credential-osxkeychain`
- Move the helper so Git can access it. This command will ask you for your (computer user) password. As you're typing your password, it won't show the characters, press return when done typing it. `sudo mv git-credential-osxkeychain /usr/local/git/bin`
- Tell git to use the helper `git config --global credential.helper osxkeychain`
- Check again to see if the helper is successfully installed `git credential-osxkeychain`
- Create a new SSH key for Github
```
cd ~/.ssh
ssh-keygen -t rsa -b 8192 -C "your@email.com"
```
- Confirm that ssh-agent is enabled
`eval "$(ssh-agent -s)"`
- Add SSH key to ssh-agent
`ssh-add ~/.ssh/id_rsa`
- Copy SSH key to clipboard
`pbcopy < ~/.ssh/id_rsa.pub`
- Login to Github
- [Add SSH key to Github](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)
- Confirm that you're good to go
`ssh -T git@github.com`


### Alfred 5

I use [Alfred 5](https://www.alfredapp.com/) though not quite as in-depth as I could. Still, I've found a few workflows that have been useful time savers. I have all of my preferences saved in Dropbox, but here is an incomplete list of regularly used workflows and settings.

First thing is to enable the paid Powerpack. The license is in the email account that I purchased it with.

Next up, activate automatic expansions, which will prompt you to allow access via OSX.

I use preferences stored in Dropbox, so as long as I remember to set them up before saving anything else, it should pull all of my workflows and settings in.

I use iTerm2, which needs to be setup as a custom shell integration in Alfred. I use the following, which opens iTerm if not open, and opens a new tab to run your commands if it is already open.

https://github.com/vitorgalvao/custom-alfred-iterm-scripts/blob/master/custom_iterm_script.applescript

```
-- For the latest version:
-- https://github.com/vitorgalvao/custom-alfred-iterm-scripts

-- Set this property to true to always open in a new window
property open_in_new_window : false

-- Set this property to false to reuse current tab
property open_in_new_tab : true

-- Set this property to true if iTerm is configured to launch without opening a new window
property iterm_opens_quietly : false

-- Handlers
on new_window()
  tell application "iTerm" to create window with default profile
end new_window

on new_tab()
  tell application "iTerm" to tell the first window to create tab with default profile
end new_tab

on call_forward()
  tell application "iTerm" to activate
end call_forward

on is_running()
  application "iTerm" is running
end is_running

on has_windows()
  if not is_running() then return false

  tell application "iTerm"
    if windows is {} then return false
    if tabs of current window is {} then return false
    if sessions of current tab of current window is {} then return false

    set session_text to contents of current session of current tab of current window
    if words of session_text is {} then return false
  end tell

  true
end has_windows

on send_text(custom_text)
  tell application "iTerm" to tell the first window to tell current session to write text custom_text
end send_text

-- Main
on alfred_script(query)
  if has_windows() then
    if open_in_new_window then
      new_window()
    else if open_in_new_tab then
      new_tab()
    else
      -- Reuse current tab
    end if
  else
    -- If iTerm is not running and we tell it to create a new window, we get two:
    -- one from opening the application, and the other from the command
    if is_running() or iterm_opens_quietly then
      new_window()
    else
      call_forward()
    end if
  end if

  -- Make sure a window exists before we continue, or the write may fail
  -- "with timeout" does not work with a "repeat"
  -- Delay of 0.01 seconds repeated 500 times means a timeout of 5 seconds
  repeat 500 times
    if has_windows() then
      send_text(query)
      call_forward()
      exit repeat
    end if

    delay 0.01
  end repeat
end alfred_script
```


## System Settings

These are things that are a bit specific to my setup, but I find that they end up making my general computing experience that much nicer.

### Mackup
Some of the below and some of the setup from above can be done with [Mackup](https://github.com/lra/mackup/), which can help keep application settings synced. Since I've already installed it before, I can run `mackup restore` to have a lot of my settings synced.

### General Settings

- Turn off all stupid notifications and badges/banners/butchers of concentration
- Set Firefox Developer Edition as the default browser
- Set Recent items to none
- Make dock nice and tiny
- Set time format to 24-hour time
- Change display energy saver settings
- Set key repeat to fast and delay until repeat to short
- Turn off keyboard brightness when computer is unused
- Setup replacement texts (like yall) so it doesn't try autocorrecting my informalities
- Set trackpad click to light, tracking speed to rather fast, and silent clicking
- Turn off launchpad trackpad gesture
- Setup internet accounts
- Show bluetooth in control center
- Show battery percentage in control center
- Show date and time in menu bar
- Ensure that guest account is off, and main account profile is set
- Show all files including hidden ones `defaults write com.apple.finder AppleShowAllFiles YES;`
- Make notification banners only display for three seconds, because ten is ridiculous. `defaults write com.apple.notificationcenterui bannerTime 3`
- Change screenshots to jpg `defaults write com.apple.screencapture type jpg`
- Disable .DS_Store files on network shares `defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE`
- Disable .DS_Store files on removable media `defaults write com.apple.desktopservices DSDontWriteUSBStores -bool TRUE`


At this point, you're probably done with computers, the internet, everything. At the very least, when you regain consciousness, your computer will be mainly good to go!
