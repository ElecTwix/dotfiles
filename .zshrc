export PATH="$HOME/.local/bin:$PATH"

# proto
export PROTO_HOME="$HOME/.proto";
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH";export PATH="$HOME/.proto/shims:$HOME/.proto/bin:$PATH"

# sheldon (plugin manager)
eval "$(sheldon source)"

eval "$(zoxide init zsh)"

. "$HOME/.turso/env"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH"

# pnpm
export PNPM_HOME="/Users/electwix/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# starship prompt
eval "$(starship init zsh)"
