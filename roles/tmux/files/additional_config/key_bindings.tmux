
# To see all the keybinds available, run:
# tmux lsk -Tprefix

# prefix key; change prefix key to ctl j
set-option -g prefix C-j
bind-key C-j send-prefix

# key bindings: reload this config and notify.
# In tmux.conf, backslash is required in order to let the second tmux command recognize its arguments.
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# open an window or pane with current directory
bind '"' split-window -c    "#{pane_current_path}"
bind %   split-window -h -c "#{pane_current_path}"
bind c   new-window   -c    "#{pane_current_path}"

# use vim key bindings in copy mode
# https://qiita.com/shimmer22/items/67ba93060ae456aadd1b
set-window-option -g mode-keys vi
bind -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind -T copy-mode-vi V send-keys -X select-line
# bind -T copy-mode-vi Esc send-keys -X clear-selection     # error occurs(message: "unknown key: Esc")

# switch window with shift + arrow
bind -n S-Left  previous-window
bind -n S-Right next-window

# swap current window with Ctl + Shift + arrow
# https://superuser.com/questions/343572/how-do-i-reorder-tmux-windows
bind -n C-S-Left  swap-window -t -1\; select-window -t -1
bind -n C-S-Right swap-window -t +1\; select-window -t +1


# move current pane by vi key binds
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

####################  experimental  ####################
bind X confirm-before kill-pane

# https://dev.to/iggredible/useful-tmux-configuration-examples-k3g
bind \` switch-client -t'{marked}'



# https://github.com/tmux/tmux/wiki/Advanced-Use
# keybinds for recording tmux outputs(tmux pipe-pane)
bind P {
    run-shell '[ -d ~/tmux/pipe_pane/$(date +%Y) ] || mkdir -p ~/tmux/pipe_pane/$(date +%Y)'
    # run-shell 'tmux set-option -g @pp_title "$(echo ~/tmux/pipe_pane/$(date +%Y)/${PANE_TITLE:-$(date +%m%d_%H%M%S)})"'
    run-shell 'tmux set-option -g @pp_title "$(echo ~/tmux/pipe_pane/$(date +%Y)/$(date +%m%d_%H%M%S))"'
    pipe-pane -o "tee #{@pp_title}.log.ansi | ansi2txt > #{@pp_title}.log"
}

bind S {
    %if '#{e|==:#{pane_pipe},1}'  # 1 will be returned if pane is being piped, see manpage
        display 'pane is piped!'
    #%elif
    %else
        display 'pane is NOT piped!' 
    %endif
}
