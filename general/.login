# HiDPI
setenv GDK_SCALE 1.8
setenv GDK_DPI_SCALE 1.8
setenv QT_AUTO_SCREEN_SCALE_FACTOR 1.8
setenv ELM_SCALE 1.8

# add scripts to PATH
set path = ($path $HOME/.local/bin/*)
setenv PATH $PATH\:$HOME/.local/bin

# ~/ Clean-up:
setenv XDG_CONFIG_HOME "$HOME/.config"
setenv XDG_DATA_HOME "$HOME/.local/share"
setenv XDG_CACHE_HOME "$HOME/.cache"

setenv XINITRC "${XDG_CONFIG_HOME}/x11/xinitrc"
setenv NOTMUCH_CONFIG "${XDG_CONFIG_HOME}/notmuch-config"
setenv GTK2_RC_FILES "${XDG_CONFIG_HOME}/gtk-2.0/gtkrc-2.0"
setenv LESSHISTFILE "-"
setenv WGETRC "${XDG_CONFIG_HOME}/wget/wgetrc"
setenv INPUTRC "${XDG_CONFIG_HOME}/shell/inputrc"
#setenv ZDOTDIR "${XDG_CONFIG_HOME}/zsh"
setenv ADOTDIR "${XDG_DATA_HOME}/antigen" # zsh plugins
setenv WINEPREFIX "${XDG_DATA_HOME}/wineprefixes/default"
setenv KODI_DATA "${XDG_DATA_HOME}/kodi"
setenv PASSWORD_STORE_DIR "${XDG_DATA_HOME}/password-store"
#setenv TMUX_TMPDIR "$XDG_RUNTIME_DIR"
setenv ANDROID_SDK_HOME "${XDG_CONFIG_HOME}/android"
setenv CARGO_HOME "${XDG_DATA_HOME}/cargo"
setenv GOPATH "${XDG_DATA_HOME}/go"
setenv ANSIBLE_CONFIG "${XDG_CONFIG_HOME}/ansible/ansible.cfg"
setenv UNISON "${XDG_DATA_HOME}/unison"
setenv HISTFILE "${XDG_DATA_HOME}/history"
setenv WEECHAT_HOME "${XDG_CONFIG_HOME}/weechat"
setenv MBSYNCRC "${XDG_CONFIG_HOME}/mbsync/config"
setenv ELECTRUMDIR "${XDG_DATA_HOME}/electrum"

# other settings:
setenv FZF_DEFAULT_OPTS "--layout=reverse" #--height 40%
setenv _JAVA_AWT_WM_NONREPARENTING 1  # Fix for Java applications in dwm
setenv PYENV_ROOT "$HOME/.local/pyenv"
setenv PATH $PYENV_ROOT/bin:$PATH
setenv PATH $PYENV_ROOT/shims:$PATH


if ( `fgconsole` == 1 ) then
  source ~/.local/profile_options.csh
  exec startx "$XDG_CONFIG_HOME/x11/xinitrc"
endif
