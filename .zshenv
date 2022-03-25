# XDG PATH
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# SQL
export export PATH=${PATH}:/opt/lamp/bin/
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history

# GNU Screen
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"

# GTK 2
# export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
# export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# kde
export KDEHOME="$XDG_CONFIG_HOME/kde"

# zsh
export ZDOTDIR=$HOME/.config/zsh

# wget
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# xinit
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export HISTFILE="$XDG_CONFIG_HOME"/zsh/history

# zoom
export SSB_HOME="$XDG_DATA_HOME"/zoom

# iBus
export GTK_IM_MODULE=ibus
export XMODFIERS=@im=ibus
export QT_IM_MODULE=ibus

export EDITOR='nvim'
# export TERMINAL="kitty"
export PAGER="bat"
export READER="okular"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# YTFZF
export YTFZF_HIST=0
export YTFZF_LOOP=0

# STARSHIP
# export STARSHIP_CONFIG=~/.config/starship/config.toml

