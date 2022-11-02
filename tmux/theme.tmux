
# TODO set these configs in zsh

time_format='%I:%M %p'
date_format='%d/%m/%Y'

scripts_dir=$DOT_DIR/scripts

TMUX_VAR_FG=#626262
TMUX_VAR_BG=#262626

TMUX_VAR_PRI=#5FAFFF


set-option -g status-interval 3
set-option -g automatic-rename on
set-option -g automatic-rename-format '#{b:pane_current_path}'

set-option -g status-fg "$TMUX_VAR_FG"
set-option -g status-bg "$TMUX_VAR_BG"

# Messages default style
set-option -g message-style "fg=$TMUX_VAR_PRI,bg=$TMUX_VAR_BG"
set-option -g message-command-style "fg=$TMUX_VAR_PRI,bg=$TMUX_VAR_BG"
set-option -g mode-style "bg=$TMUX_VAR_PRI,fg=$TMUX_VAR_FG" # Copy and paste highlighting

# Status Left
set-option -g status-left-length 25
set-option -g status-left "#[fg=$TMUX_VAR_BG,bg=#{?client_prefix,$TMUX_VAR_FG,$TMUX_VAR_PRI,}] #S #[bg=$TMUX_VAR_BG] "

# Window Status
set-option -g window-status-format " #I #W "
set-option -g window-status-current-format "#[fg=$TMUX_VAR_PRI,bold] #I #W "

# Status Right
set-option -g status-right-length 50
TMUX_VAR_RS="#[fg=$TMUX_VAR_PRI,bold] #($scripts_dir/network.sh) "
TMUX_VAR_RS="$TMUX_VAR_RS#[bg=$TMUX_VAR_PRI,fg=$TMUX_VAR_BG,nobold] #(date +'$time_format') #(date +'$date_format') "
set-option -g status-right $TMUX_VAR_RS

