# 1. Enable parameter expansion in the prompt (The Missing Link)
setopt PROMPT_SUBST

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
# %b is the branch name, %u is for unstaged changes
zstyle ':vcs_info:git:*' formats ' (%b)'

# Set up the prompt
# %~ shows the full path (with ~ for home)
# ${vcs_info_msg_0_} injects the branch info
PROMPT='%F{green}%n@%m %F{blue}%1~%f${vcs_info_msg_0_}%f $ '
alias ls='ls -G'

set_terminal_title() {
  # %2d shows the last 2 segments of the path
  # The '...' is added manually for your visual preference
  print -Pn "\e]1;.../%2d\a"
}

# Run the function before every prompt (when changing dirs)
add-zsh-hook precmd set_terminal_title

export PATH="/opt/homebrew/bin:$PATH"
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=$PATH:/Users/nomad/go/bin
export FZF_DEFAULT_COMMAND='cat ~/.zsh_history'
export PATH="$HOME/.local/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

