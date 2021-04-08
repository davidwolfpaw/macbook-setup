# David's Mac OSX v11.2 macOS BigSur Setup Guide

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


## Install Basic Software

This is the software that I use on a very regular basis. Not all software is listed, as this would be one of the most time consuming to keep up to date.

### Install from App Store/Web
- [Amphetamine](https://itunes.apple.com/us/app/amphetamine/id937984704?mt=12)
- [Giphy Capture](https://itunes.apple.com/us/app/giphy-capture.-the-gif-maker/id668208984?mt=12)
- [Pixelmator](https://itunes.apple.com/us/app/pixelmator/id407963104?mt=12)
- [VS Code](https://code.visualstudio.com/download)

### Homebrew
##### Run Xcode and accept the license

Homebrew can not install properly until this occurs.

```
xcode-select --install
```

##### Install Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew doctor
```

##### Install Homebrew extension Cask

```
brew install cask
brew tap homebrew/cask-fonts
```

##### Install common applications via Homebrew
_Yes, you can run this all as one `brew install` command followed by the list of applications, but some require additional input or could have other issues installing, so I run them separately to give an easy way to continue if needed_

```
brew install arp-scan
brew install bat
brew install brew-cask-completion
brew install cask
brew install cmake
brew install composer
brew install curl
brew install diff-so-fancy
brew install eslint
brew install fd
brew install ffmpeg
brew install fzf
brew install ghostscript
brew install git
brew install highlight
brew install htop
brew install imagemagick
brew install mackup
brew install markdown
brew install ncdu
brew install nmap
brew install noti
brew install openjdk
brew install pandoc
brew install phplint
brew install pipenv
brew install prettyping
brew install vassh
brew install vim
brew install webtorrent-cli
brew install wget
brew install wp-cli
brew install wp-cli-completion
brew install youtube-dl
brew install zsh-completions
brew install zsh-syntax-highlighting

brew install awscli
brew install docbook-xsl
brew install gnupg
brew install go
brew install hopenpgp-tools
brew install imageoptim-cli
brew install lastpass-cli --with-pinentry --with-doc
brew install pkg-config
brew install thefuck
brew install tldr
brew install wrk
brew install ykman
brew install zsh
```

##### Install applications via Homebrew Cask

Seriously, barring the insertion of malicious code or lack of checksums (two things which should honestly scare me away of many), Cask is pretty useful. I'm choosing to be willfully ignorant, since broadcasting usage opens me up anyway, and this saves a lot of time.

```
brew cask install adoptopenjdk
brew cask install alfred
brew cask install balenaetcher
brew cask install calibre
brew cask install cleanmymac
brew cask install dbeaver-community
brew cask install dropbox
brew cask install firefox-developer-edition
brew cask install font-hack
brew cask install font-hack-nerd-font
brew cask install font-roboto
brew cask install font-roboto-mono
brew cask install font-source-code-pro
brew cask install google-chrome
brew cask install imageoptim
brew cask install iterm2
brew cask install nordvpn
brew cask install sequel-pro
brew cask install signal
brew cask install spectacle
brew cask install sublime-text
brew cask install telegram
brew cask install the-unarchiver
brew cask install transmit
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc

// Some of my maybe installs
brew cask install arduino
brew cask install boostnote
brew cask install owasp-zap
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install simplenote
brew cask install steam
brew cask install thunderbird
brew cask install webpquicklook
brew cask install zotero
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
alias gits="git status"
alias gita="git add ."
alias gitc="git commit -m"
alias gitpom="git push -u origin master"
alias sizesort="du -d 1 -h | sort -h"
```

#### Misc Tools
- [Has](https://github.com/kdabir/has) for checking dependencies and versions
`git clone https://github.com/kdabir/has.git && cd has && make install`
- With PHPCS and WPCS installed, we've gotta tell PHPCS where to find WPCS
`phpcs --config-set installed_paths ~/.composer/vendor/wp-coding-standards/wpcs`


### VirtualBox, Vagrant, & VVV

- Ensure that Virtual Box and Vagrant are installed
- Clone VVV `git clone git://github.com/Varying-Vagrant-Vagrants/VVV.git vagrant-local`
- Move to vagrant-local `cd vagrant-local`
- Run our first Vagrant up and wait a long long time `vagrant up`
- Look, at this point you probably need a coffee or something. Relax, you're doing great, and treat yourself to that caffeinated goodness.
- Turn on [xDebug](https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Code-Debugging#turning-on-xdebug) with `vagrant ssh` then `xdebug_on`
- Setup a command in sudoers to skip the password for `vagrant up, vagrant halt, vagrant reload` by using the command `sudo visudo` then entering the following at the end of the file, and exiting vi by typing esc, then `:wq`

```
# Allow passwordless startup of Vagrant when using NFS and vagrant-hostsupdater plugin
Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports
Cmnd_Alias VAGRANT_NFSD = /sbin/nfsd restart
Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /usr/bin/sed -E -e /*/ d -ibak /etc/exports
Cmnd_Alias VAGRANT_HOSTSUPDATER_ADD = /bin/sh -c echo "*" >> /etc/hosts
Cmnd_Alias VAGRANT_HOSTSUPDATER_REMOVE = /usr/bin/sed -i -e /*/ d /etc/hosts
%admin ALL=(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE, VAGRANT_HOSTSUPDATER_ADD, VAGRANT_HOSTSUPDATER_REMOVE
```


### Set Up Applications

- Login to Chrome & Firefox to download and setup extensions
- Login to Dropbox and get files
- Login to all active Slack teams
- Make dev files that I use open in Sublime Text (things like .txt, .sh, .json)
- Setup Spectacle shortcuts so they don't interfere with Chrome shortcuts
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


### Sublime Text 3
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


### Gitting on with Git
- Xcode and git are installed, right?
- If so, running `xcode-select --install` will get you the prompts for the Xcode Command Line Tools
- Set some defaults up.
```
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git config --global github.user githubusername
git config --global push.default current
git config --global core.editor "subl -w"
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


### Alfred 4

I use [Alfred 4](https://www.alfredapp.com/) though not quite as in-depth as I could. Still, I've found a few workflows that have been useful time savers. I have all of my preferences saved in Dropbox, but here is an incomplete list of regularly used workflows and settings.

First thing is to enable the paid Powerpack. The license is in the email account that I purchased it with.

Next up, activate automatic expansions, which will prompt you to allow access via OSX.

I use preferences stored in Dropbox, so as long as I remember to set them up before saving anything else, it should pull all of my workflows and settings in. Here are a few of them that I use from time to time.

- [Route to contact or location]
(http://www.packal.org/workflow/route-contact-or-location) - type "route" and a name or address, get a Google Map from my current location
- Install Capture::Tiny to make the Lastpass CLI work
`sudo cpan install Capture::Tiny`
- [Lastpass CLI Workflow](http://www.packal.org/workflow/lastpass-cli-workflow-alfred) - Quickly search Lastpass
- Set Lastpass email in Alfred settings with
`lpsetemail your@email.com`
- [Transmit](http://www.packal.org/workflow/transmit) - search and open favorites in Transmit 4 using the keyword "default ftp"
- [Launch URL in 3 browsers](http://www.packal.org/workflow/launch-url-3-browsers) - use "test" and a URL to open that site in Firefox, Chrome, and Safari
- [Network Tools](http://www.packal.org/workflow/network-tools) - make stuff like pings and cache flush fast
- [Wi-Fi Restart](http://www.packal.org/workflow/wi-fi-restart) - I hate needing this, but my computer just doesn't like staying connected. What am I doing wrong, computer!
- [Giphy](http://www.packal.org/workflow/giphy) - Use the command "giphy" to find the perfect gif
- [gitignore](http://www.packal.org/workflow/gitignore-0) - Create common .gitignore file templates. Use `gitignore-update` on first run to download templates
- [PHP Doc Search](http://www.packal.org/workflow/php-doc-search) - use "phpdoc" to search php.net
- [Alfred Drive Workflow](http://www.packal.org/workflow/google-drive) - Search Google Drive with "d"
- [OS X Toolbox](http://sayzlim.net/os-x-toolbox-workflow-alfred-2/) - tools to relaunch finder and dock, purge inactive memory, toggle desktop, toggle system files, and rebuild launch services.
- [Secure Password Generator](http://www.packal.org/workflow/secure-password-generator) - Make some secure passwords to copy to clipboard easily
- [Emoji Codes](https://github.com/carlosgaldino/alfred-emoji-workflow) - I can't not use emoji now, join the crowd

I use iTerm2, which needs to be setup as a custom shell integration in Alfred. I use the following, which opens iTerm if not open, and opens a new tab to run your commands if it is already open.

```
on alfred_script(q)  
  tell application "System Events"
    -- some versions might identify as "iTerm2" instead of "iTerm"
    set isRunning to (exists (processes where name is "iTerm")) or (exists (processes where name is "iTerm2"))
  end tell
  
  tell application "iTerm"
    activate
    set hasNoWindows to ((count of windows) is 0)
    if isRunning and hasNoWindows then
      create window with default profile
    end if
    select first window
    
    tell the first window
      if isRunning and hasNoWindows is false then
        create tab with default profile
      end if
      tell current session to write text q
    end tell
  end tell

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
- Add Colemak input source
- Set trackpad click to light, tracking speed to rather fast, and silent clicking
- Turn off launchpad trackpad gesture
- Setup internet accounts (email, Twitter)
- Show bluetooth in menu bar
- Show battery percentage in menu bar
- Show date and time but not day in menu bar
- Ensure that guest account is off, and main account profile is set
- Show all files including hidden ones `defaults write com.apple.finder AppleShowAllFiles YES;`
- Make notification banners only display for three seconds, because ten is ridiculous. `defaults write com.apple.notificationcenterui bannerTime 3`
- Change screenshots to jpg `defaults write com.apple.screencapture type jpg`



At this point, you're probably done with computers, the internet, everything. At the very least, when you regain consciousness, your computer will be mainly good to go!
