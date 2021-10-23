
# Stop the greeting
set --erase fish_greeting

# Set the bob the fish theme color
set -g theme_color_scheme light

# Make control backspace
bind \cH backward-kill-word

# Aliases
alias vim="nvim"

# Creates colored man pages.
set -x LESS_TERMCAP_mb (printf "\033[01;31m")  
set -x LESS_TERMCAP_md (printf "\033[01;31m")  
set -x LESS_TERMCAP_me (printf "\033[0m")  
set -x LESS_TERMCAP_se (printf "\033[0m")  
set -x LESS_TERMCAP_so (printf "\033[01;44;33m")  
set -x LESS_TERMCAP_ue (printf "\033[0m")  
set -x LESS_TERMCAP_us (printf "\033[01;32m")
