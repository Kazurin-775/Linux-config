# Default configuration file for tmux-powerline.
# Modeline {
#     vi: foldmarker={,} foldmethod=marker foldlevel=0 tabstop=4 filetype=sh
# }

# General {
    export TMUX_POWERLINE_DEBUG_MODE_ENABLED="false"
    export TMUX_POWERLINE_PATCHED_FONT_IN_USE="true"

    export TMUX_POWERLINE_THEME="slim"
    export TMUX_POWERLINE_STATUS_LEFT_LENGTH="20"
    export TMUX_POWERLINE_STATUS_RIGHT_LENGTH="80"

    export TMUX_POWERLINE_DIR_USER_THEMES="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/themes"

    # The initial visibility of the status bar. Can be {"on", "off", "2"}. 2 will create two status lines: one for the window list and one with status bar segments. 
    export TMUX_POWERLINE_STATUS_VISIBILITY="on"
    # In case of visibility = 2, where to display window status and where left/right status bars.
    # 0: window status top, left/right status bottom; 1: window status bottom, left/right status top
    export TMUX_POWERLINE_WINDOW_STATUS_LINE=0
    # The status bar refresh interval in seconds.
    # Note that events that force-refresh the status bar (such as window renaming) will ignore this.
    export TMUX_POWERLINE_STATUS_INTERVAL="10"
    # The location of the window list. Can be {"absolute-centre, centre, left, right"}.
    # Note that "absolute-centre" is only supported on `tmux -V` >= 3.2.
    export TMUX_POWERLINE_STATUS_JUSTIFICATION="left"

    export TMUX_POWERLINE_WINDOW_STATUS_SEPARATOR=""

    # Uncomment these if you want to enable tmux bindings for muting (hiding) one of the status bars.
    # E.g. this example binding would mute the left status bar when pressing <prefix> followed by Ctrl-[
    #export TMUX_POWERLINE_MUTE_LEFT_KEYBINDING="C-["
    #export TMUX_POWERLINE_MUTE_RIGHT_KEYBINDING="C-]"
# }

# date.sh {
    export TMUX_POWERLINE_SEG_DATE_FORMAT="%B %d"
# }
