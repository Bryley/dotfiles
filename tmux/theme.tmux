
time_format='%I:%M %p'
date_format='%d/%m/%Y'

scripts_dir=$DOT_DIR/scripts

FG=#626262
BG=#262626

PRI=#5FAFFF

set-option -g status-interval 3
set-option -g status-fg "$FG"
set-option -g status-bg "$BG"

# Messages default style
set-option -g message-style "fg=$PRI,bg=$BG"
set-option -g message-command-style "fg=$PRI,bg=$BG"
set-option -g mode-style "bg=$PRI,fg=$FG" # Copy and paste highlighting

# Status Left
set-option -g status-left-length 25
set-option -g status-left "#[fg=$BG,bg=#{?client_prefix,$FG,$PRI,}] #S #[bg=$BG] "

# Window Status
set-option -g window-status-format " #I #W "
set-option -g window-status-current-format "#[fg=$PRI,bold] #I #W "

# Status Right
set-option -g status-right-length 50
RS="#[fg=$PRI,bold] #($scripts_dir/network.sh) "
RS="$RS#[bg=$PRI,fg=$BG,nobold] #(date +'$time_format') #(date +'$date_format') "
set-option -g status-right $RS

