# David's Mac OS X 10.11 El Captin Update Guide

Blatantly stealing the idea from Kevin Elliott's [El Capitan Guide](https://gist.github.com/kevinelliott/e12aa642a8388baf2499), I've decided to document as much as I can of my new computer setup guide. There's a lot to do when refreshing a computer or setting one up from scratch, but a bit of planning reduces a ton of pain later on.

If there are steps that you've noticed that I'm clearly missing, please let me know. If you want to fork this guide to make your own, go right ahead!



## Install Basic Software

This is the software that I use on a very regular basis. Not all software is listed, as this would be one of the most time consuming to keep up to date.

### Install from App Store
- [Airmail](https://itunes.apple.com/us/app/airmail-2.6/id918858936?mt=12)
- [Xcode](https://developer.apple.com/xcode/download/)
- [Keynote](https://itunes.apple.com/us/app/keynote/id409183694?mt=12)
- [Pages](https://itunes.apple.com/us/app/pages/id409201541?mt=12)
- [Noizio](https://itunes.apple.com/us/app/noizio/id928871589?mt=12)
- [Giphy Capture](https://itunes.apple.com/us/app/giphy-capture.-the-gif-maker/id668208984?mt=12)

### Install from the Web
- [Sublime Text 3](http://www.sublimetext.com/3)
- [NordVPN](https://nordvpn.com/profile/)
- [Aerial Screensaver](https://github.com/JohnCoates/Aerial/releases/download/v1.1/Aerial.zip)

### Homebrew
#### Run Xcode and accept the license

Homebrew can not install properly until this occurs.

#### Install Homebrew

```ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor```

#### Install Homebrew extension Cask

```brew install caskroom/cask/brew-cask```

#### Install common applications via Homebrew

```brew install openssl wget```

#### Install applications via Homebrew Cask

Seriously, barring the insertion of malicious code or lack of checksums (two things which should honestly scare me away of many), Cask is pretty useful. I'm choosing to be willfully ignorant, since broadcasting usage opens me up anyway, and this saves a lot of time.

``` 
brew cask install chrome
brew cask install firefox
brew cask install dropbox
brew cask install evernote
brew cask install rescuetime
brew cask install skype
brew cask install virtualbox
brew cask install vagrant
brew cask install slack
brew cask install flux
brew cask install iterm2
brew cask install owasp-zap
brew cask install sequel-pro
brew cask install
```


### Vagrant, VVV, VV

- Ensure that Virtual Box and Vagrant are installed
- Install vagrant-hostupdater `vagrant plugin install vagrant-hostsupdater`
- Install vagrant-triggers `vagrant plugin install vagrant-triggers`
- Clone VVV `git clone git://github.com/Varying-Vagrant-Vagrants/VVV.git vagrant-local`
- Move to vagrant-local `cd vagrant-local`
- Run our first Vagrant up and wait a long long time `vagrant up`
-- Look, at this point you probably need a coffee or something. Relax, you're doing great, and treat yourself to that caffeinated goodness.
- Install Variable VVV ` brew install bradp/vv/vv`
- Setup [VV Blueprints](https://github.com/bradp/vv#blueprints)
- Install @topdown's VVV dashboard
```cd ~/vagrant-local/www/default
git clone https://github.com/topdown/VVV-Dashboard.git dashboard
```
- Copy dashboard-custom.php to `vagrant-local/www/default/dashboard-custom.php`


### Set Up Applications

- Login to Chrome to download and setup extensions
- Setup all Airmail accounts and settings
- License Sublime Text and Sublime-FTP (license and instructions in email)
- Login to Dropbox and get files
- Login to Evernote and enable Web Clipper
- Login to all active Slack teams


### Gitting on with Git
- Xcode and git are installed, right?
- If so, running `xcode-select --installe` will get you the prompts for the Xcode Command Line Tools
- Set some defaults up.
```
git config --global user.name "David Laietta"
git config --global user.email "davidjlaietta@gmail.com"
```
- Check that keychain helper is installed with `git credential-osxkeychain`
-- If not installed, set that sucker up.
```
# Download the keychain helper
$ curl -s -O http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain

# Modify permissions on the helper so it can operate
$ chmod u+x git-credential-osxkeychain

# Move the helper so Git can access it. This command will ask you for your (computer user) password. As you're typing your password, it won't show the characters, press return when done typing it.
$ sudo mv git-credential-osxkeychain /usr/local/git/bin

# Tells Git to use the helper
$ git config --global credential.helper osxkeychain

# Check again to see if the helper is successfully installed
$ git credential-osxkeychain
```
- Create a new SSH key for Github
```cd ~/.ssh
ssh-keygen -t rsa -b 8192 -C "davidjlaietta@gmail.com"```
- Confirm that ssh-agent is enabled `eval "$(ssh-agent -s)"`
- Add SSH key to ssh-agent `ssh-add ~/.ssh/id_rsa`
- Copy SSH key to clipboard `pbcopy < ~/.ssh/id_rsa.pub`
- Login to Github
- [Add SSH key to Github](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)
- Confirm that you're good to go `ssh -T git@github.com`

## System Settings 

These are things that are a bit specific to my setup, but I find that they end up making my general computing experience that much nicer.

- Turn off all stupid notifications and badges/banners/butchers of concentration
- Set Chrome as the default browser
- Set Recent items to none
- Make dock nice and tiny
- Set time format to 24-hour time
- Change display energy saver settings
- Set key repeat to fast and delay untilr epeat to short
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



At this point, you're probably done with computers, the internet, everything. At the very least, when you regain consciousness, your computer will be mainly good to go!
