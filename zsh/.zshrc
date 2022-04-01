#
# Bryley's Z Shell RC, github username: Bryley
#

# Some useful options
stty stop undef                     # Disable Ctrl-S from freezing screen
zle_highlight=('paste:none')        # Stop pasted from being highlighted

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Key Bindings
bindkey '^H' backward-kill-word     # Makes Ctrl-Backspace delete word
# Below are making the word a lowercase vim word not a uppercase Word
autoload -U select-word-style
select-word-style bash

# Include files
source "$ZDOTDIR/zsh-functions"
[ -f "$HOME/.profile" ] && source "$HOME/.profile"
# Include the generated .profile if exists
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-vim"
# zsh-machine-custom can be created, it includeds zsh configs that should not be shared, eg. custom extra paths
zsh_add_file "zsh-machine-custom"

# Plugins
# zsh_add_plugin "romkatv/powerlevel10k" # Adds theme
zsh_add_plugin "zsh-users/zsh-autosuggestions" # Fish like suggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zsh_add_plugin "zsh-users/zsh-syntax-highlighting" # Fish like syntax
# End of plugins

# Sourcing extra files
source /usr/share/doc/pkgfile/command-not-found.zsh
[ -f "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"

# My theme
zsh_add_file "zsh-prompt"


# For the powerlevel10k theme
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# The following lines were added by compinstall TODO remove later

# zstyle ':completion:*' completer _complete _ignored
# zstyle :compinstall filename '/home/bryley/.config/zsh/.zshrc'
# 
# autoload -Uz compinit
# compinit

# End of lines added by compinstall
