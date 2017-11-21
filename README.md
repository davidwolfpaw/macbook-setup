# David's Mac OS X 10.13 MacOS High Sierra Setup Guide

Blatantly stealing the idea from Kevin Elliott's [El Capitan Guide](https://gist.github.com/kevinelliott/e12aa642a8388baf2499), I've decided to document as much as I can of my new computer setup guide. There's a lot to do when refreshing a computer or setting one up from scratch, but a bit of planning reduces a ton of pain later on. :relaxed:

If there are steps that you've noticed that I'm clearly missing, please let me know. If you want to fork this guide to make your own, go right ahead!



## Install Basic Software

This is the software that I use on a very regular basis. Not all software is listed, as this would be one of the most time consuming to keep up to date.

### Install from App Store
- [Airmail](https://itunes.apple.com/us/app/airmail-3/id918858936?mt=12)
- [Amphetamine](https://itunes.apple.com/us/app/amphetamine/id937984704?mt=12)
- [CleanMyDrive 2](https://itunes.apple.com/us/app/cleanmydrive-2-manage-and-clean-external-drives/id523620159?mt=12)
- [Extractor](https://itunes.apple.com/us/app/extractor-unarchive-rar-zip-tar-7z-bzip2-files/id971826370?mt=12)
- [Giphy Capture](https://itunes.apple.com/us/app/giphy-capture.-the-gif-maker/id668208984?mt=12)
- [Keynote](https://itunes.apple.com/us/app/keynote/id409183694?mt=12)
- [Noizio](https://itunes.apple.com/us/app/noizio/id928871589?mt=12)
- [Pages](https://itunes.apple.com/us/app/pages/id409201541?mt=12)
- [Pixelmator](https://itunes.apple.com/us/app/pixelmator/id407963104?mt=12)

### Install from the Web
- [NordVPN](https://nordvpn.com/profile/)
- [Aerial Screensaver](https://github.com/JohnCoates/Aerial/releases/download/v1.1/Aerial.zip)

### Homebrew
##### Run Xcode and accept the license

Homebrew can not install properly until this occurs.

```
xcode-select --install
sudo xcodebuild -license accept
```

##### Install Homebrew

`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor`

##### Install Homebrew extension Cask

`brew install caskroom/cask/brew-cask`

##### Install common applications via Homebrew

```
brew install brew-cask-completion
brew install ghostscript
brew install git
brew install imagemagick
brew install lastpass-cli --with-pinentry --with-doc
brew install openssl
brew install node
brew install homebrew/php/phpunit
brew install vassh
brew install wget
brew install wrk
```

##### Install applications via Homebrew Cask

Seriously, barring the insertion of malicious code or lack of checksums (two things which should honestly scare me away of many), Cask is pretty useful. I'm choosing to be willfully ignorant, since broadcasting usage opens me up anyway, and this saves a lot of time.

```
brew cask install alfred
brew cask install betterzipql
brew cask install calibre
brew cask install cleanmymac
brew cask install dropbox
brew cask install etcher
brew cask install evernote
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install imageoptim
brew cask install iterm2
brew cask install owasp-zap
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlprettypatch
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install rescuetime
brew cask install skype
brew cask install sequel-pro
brew cask install slack
brew cask install spectacle
brew cask install station
brew cask install sublime-text
brew cask install suspicious-package
brew cask install the-unarchiver
brew cask install transmit
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc
brew cask install webpquicklook
```
#### Additional Command Line Installs
```
npm install -g yo
```

### Vagrant, VVV, VV

- Ensure that Virtual Box and Vagrant are installed
- Install vagrant-hostupdater `vagrant plugin install vagrant-hostsupdater`
- Install vagrant-triggers `vagrant plugin install vagrant-triggers`
- Install vagrant-vbguest `vagrant plugin install vagrant-vbguest`
- Clone VVV `git clone git://github.com/Varying-Vagrant-Vagrants/VVV.git vagrant-local`
- Move to vagrant-local `cd vagrant-local`
- Run our first Vagrant up and wait a long long time `vagrant up`
- Look, at this point you probably need a coffee or something. Relax, you're doing great, and treat yourself to that caffeinated goodness.
- Install Variable VVV ` brew install bradp/vv/vv`
- Setup [VV Blueprints](https://github.com/bradp/vv#blueprints)
- Turn on [xDebug](https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Code-Debugging#turning-on-xdebug) with `vagrant ssh` then `xdebug_on`
- Install @topdown's VVV dashboard

```
cd ~/vagrant-local/www/default
git clone https://github.com/topdown/VVV-Dashboard.git dashboard
cp dashboard/dashboard-custom.php .
```
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

- Install VVV Provision Flipper by copying [flip](https://raw.githubusercontent.com/bradp/vvv-provision-flipper/master/flip) into one of your $PATH folders and running `chmod +x flip` if necessary. Then set a default of the quick setup with `flip set quick`


### Set Up Applications

- Login to Chrome to download and setup extensions
- Setup all Airmail accounts and settings
- Login to Dropbox and get files
- Login to Evernote and enable Web Clipper
- Login to all active Slack teams
- Make dev files that I use open in Sublime Text (things like .txt, .sh, .json)
- Setup Spectacle shortcuts so they don't interfere with Chrome shortcuts
- Make iTerm2 look pretty, like with Glacier theme from http://iterm2colorschemes.com/
- I save custom scripts in Dropbox because I would probably lose them somehow otherwise. The files here have to be sourced, and the folder has to be added to the PATH environment variable. Both of those are accomplished with this portion of my `.bash_rc` file:
```
# Add my scripts folder to the path
PATH=$PATH:~/Dropbox/scripts
# Source stuff!
source ~/.bashrc

for f in ~/Dropbox/scripts/*; do
	if [[ $file == *.sh ]]
	then
		source "$f"
	fi
done
```


### Sublime Text 3
- License Sublime Text and SFTP (license and instructions in email)
- Sublime Text CLI 
```
mkdir -p ~/bin && ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
```
- Install Package Control by opening Sublime Text, opening the command prompt with ctrl+`, and entering the following:
```
import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```
- Install Packages: Accessibility, ACF Snippets, Boxy Theme, BracketHighlighter, CSS Completions, Diffy, Emmet, Genesis, Gist, HyperlinkHelper, JSLint, JSONLint, ReadmePlease, SFTP, SidebarEnhancements, Trailing Spaces, WordPress Completions, WordPress Customizer, WordPress Developer Assistant
- Symlink so I can open files in Sublime from the command line
```
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
```


### Gitting on with Git
- Xcode and git are installed, right?
- If so, running `xcode-select --install` will get you the prompts for the Xcode Command Line Tools
- Set some defaults up.
```
git config --global user.name "David Laietta"
git config --global user.email "davidjlaietta@gmail.com"
git config --global github.user davidlaietta
git config --global color.ui true
git config --global push.default current
git config --global core.editor "subl -w"
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
ssh-keygen -t rsa -b 8192 -C "davidjlaietta@gmail.com"
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


### Alfred 3

I use [Alfred 3](https://www.alfredapp.com/) though not quite as in-depth as I could. Still, I've found a few workflows that have been useful time savers.

First thing is to enable the paid Powerpack. The license is in the email account that I purchased it with.

Next up, activate automatic expansions, which will prompt you to allow access via OSX.

- [Route to contact or location]
(http://www.packal.org/workflow/route-contact-or-location) - type "route" and a name or address, get a Google Map from my current location
- Install Capture::Tiny to make the Lastpass CLI work
`sudo cpan install Capture::Tiny`
- [Lastpass CLI Workflow](http://www.packal.org/workflow/lastpass-cli-workflow-alfred) - Quickly search Lastpass
- Set Lastpass email in Alfred settings with
`lpsetemail davidjlaietta@gmail.com`
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

- Turn off all stupid notifications and badges/banners/butchers of concentration
- Set Chrome as the default browser
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
- Setup internet accounts (email, Twitter, Facebook)
- Show bluetooth in menu bar
- Show battery percentage in menu bar
- Show date and time but not day in menu bar
- Ensure that guest account is off, and main account profile is set
- Show all files including hidden ones `defaults write com.apple.finder AppleShowAllFiles YES;`
- Make notification banners only display for three seconds, because ten is ridiculous. `defaults write com.apple.notificationcenterui bannerTime 3`



At this point, you're probably done with computers, the internet, everything. At the very least, when you regain consciousness, your computer will be mainly good to go!
