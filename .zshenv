# XDG PATH
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# Android Studio
export ANDROID_HOME="$XDG_DATA_HOME"/android

# Bash
export HISTFILE="${XDG_STATE_HOME}"/bash/history

# SQL
export export PATH=${PATH}:/opt/lamp/bin/
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history

# GNU Screen
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"

# GTK
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Icons
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons

# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# kde
export KDEHOME="$XDG_CONFIG_HOME/kde"

# xinit
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

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

# wget
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# YTFZF
export YTFZF_HIST=0
export YTFZF_LOOP=0

# Zsh
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="${XDG_STATE_HOME}"/zsh/history


# Hardware Accelaration
# export VAAPI_MPEG4_ENABLED=true
# export LIBVA_DRIVER_NAME=iHD
# export LIBVA_DRIVER_NAME=i965
# export VDPAU_DRIVER=va_gl
# if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
#    export MOZ_ENABLE_WAYLAND=1
# fi
# STARSHIP
# export STARSHIP_CONFIG=~/.config/starship/config.toml

