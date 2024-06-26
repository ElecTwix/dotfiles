
# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "jeffreytse/zsh-vi-mode"

eval "$(starship init zsh)"

# Load and initialise completion system
autoload -Uz compinit

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias theme="kitty +kitten themes --reload-in=all" # then add theme name
alias icat="kitty +kitten icat" # then add image name
alias connect="kitty +kitten ssh"
alias lint="golangci-lint run"


alias reporefresh=systemctl start reflector.service
alias reporefreshStatus=systemctl status reflector.service

alias ssh="kitty +kitten ssh"


export ANDROID_HOME='/opt/android-sdk'

# pnpm
export PNPM_HOME="/home/electwix/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
#export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
source /usr/share/nvm/init-nvm.sh

eval "$(zoxide init zsh)"

# Turso
export PATH="/home/electwix/.turso:$PATH"

# esp-idf
export IDF_PATH=/opt/esp-idf
alias idf-init=". /opt/esp-idf/export.sh"

export LITFLAGS="-j 8"

export PATH="$HOME/.cargo/bin:$PATH"
