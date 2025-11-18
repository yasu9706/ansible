###########################################################################################
#########     status bar                                                        ###########
###########################################################################################

## toggle status bar
bind-key b set -g status

# format for "window-status" in "current window"
set-window-option -g window-status-current-format "#[fg=brightblack,bg=brightwhite] #I: #W #{?pane_pipe,#[fg=red]⬤ #[fg=brightblack],}#[none]"

############################################################
# 以下はwindow-status-current-formatを複数に分割して宣言して、あとから連結することを試みたもの
# pane_pipeがエスケープされずにそのまま'{?pane_pipe}'と表示される
# set-option -g @base_window_status_current "#[fg=brightblack,bg=brightwhite] #I: #W "
# set-option -g @pipe_pane_mark             "#{?pane_pipe,#[fg=red]⬤ #[fg=brightblack],}"
# set-window-option -g window-status-current-format "#{@base_window_status_current}#{@pipe_pane_mark}#[none]"
############################################################

# format for "window-status" NOT in "current window"
set-window-option -g window-status-format " #I: #W "

# tmuxのコマンド履歴(tmux kill-sessionなど)を.bash_profileのようにファイルに保存
set -sg history-file ~/tmux/history

# toggle color of "left status" when prefix key pressed
set-option -g status-left '#{?client_prefix,#[reverse],} #S '

# default bar color
set-option -g status-style "fg=brightwhite,bg=brightblack"

# active pane
set -g pane-active-border-style "fg=#fccc96"

# renumber when a window closed
set -g renumber-windows on   


# status-right(default)
# for details in date time format, see man strftime(3)
set-option -g status-right '#{?window_bigger,[#{window_offset_x}#,#{window_offset_y}] ,}"#{=21:pane_title}" %H:%M %Y%b%d'



############################################################
# Activity, https://github.com/tmux/tmux/wiki/Advanced-Use
# tmux supports 3 kinds of notification,
# 1. bell (activated if ASCII character `BEL` is received)
# 2. activity (activated when any output is received from program)
# 3. silence (activated when no output is received)
############################################################
# toggle status color whose window received any output
# see also section 'set-option' and 'target-pane' in manpage
set-option -wt:0 monitor-activity on
set -g visual-activity on

# https://unix.stackexchange.com/questions/339446/how-to-make-tmux-messages-stay-longer
set-option -g display-time 3000




