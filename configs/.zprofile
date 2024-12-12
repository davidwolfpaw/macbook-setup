# A collection of path areas that I've added
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.composer/vendor/bin:/usr/local/lib/node_modules:/usr/local/bin/php:$PATH"
# Source for M1 Macs
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add my scripts folder to the path
PATH=$PATH:$HOME/Documents/scripts/zsh

for f in ~/Documents/scripts/zsh/*; do
        if [[ $file == *.sh ]]
        then
                chmod +x "$f"
                source "$f"
        fi
done

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="htop"
alias du="ncdu --color dark -rr -x --exclude .git"
alias gits="git status"
alias gita="git add ."
alias gitc="git commit -m"
alias gitpom="git push -u origin main"
alias torrent="torrent.sh"
alias pdfcompress="_pdf_compress"
alias sizesort="du -d 1 -h | sort -h"
alias fixcamera="sudo killall VDCAssistant"
alias fixaudio="sudo kill -9 `ps ax | grep 'coreaudio[a-z]' | awk '{print $1}'`"
alias fixbluetooth="sudo rm -R /Library/Preferences/com.apple.Bluetooth.plist"

function _pdf_compress(){
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$2 $1;
}
