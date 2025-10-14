
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias theme="kitty +kitten themes --reload-in=all" # then add theme name
alias icat="kitty +kitten icat" # then add image name
#alias ssh="kitty +kitten ssh"
alias lint="golangci-lint run"


export ANDROID_HOME='/home/electwix/Android/Sdk'

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
#source /usr/share/nvm/init-nvm.sh

alias idf-init="source /home/electwix/dev/C/esp-idf/export.sh"

# Turso
export PATH="/home/electwix/.turso:$PATH"
export PATH="$HOME/esp/xtensa-esp32-elf/bin:$PATH"

export VITE_URL="keepitdev.com"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"

eval "$(starship init zsh)"

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

zinit ice
zinit light zsh-users/zsh-autosuggestions

zinit ice
zinit light starship/starship

zinit ice
zinit light MichaelAquilina/zsh-auto-notify


eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
