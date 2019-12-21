# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# add composer executables
if [ -d "$HOME/.config/composer/vendor/bin" ]; then
    PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

# add GHCup environment and path
if [ -f "$HOME/.ghcup/env" ]; then
    source "$HOME/.ghcup/env"
fi

# add Cargo binaries to the path
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

# load stuff for NVM
if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
    source /usr/share/nvm/init-nvm.sh
else
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
fi

# set Android SDK settings
if [ -d "$HOME/dev/dev-tools/android-sdk" ]; then
    export ANDROID_HOME="$HOME/dev/dev-tools/android-sdk/"
fi

# set the default visual editor for some programs
if [ -x "$(command -v nvim)" ]; then
    # NeoVIM
    export VISUAL=nvim
elif [ -x "$(command -v vim)" ]; then
    # Vi Improved (vim)
    export VISUAL=vim
elif [ -x "$(command -v vi)" ]; then
    # Vi
    export VISUAL=vi
elif [ -x "$(command -v nano)" ]; then
    # GNU Nano
    export VISUAL=nano
fi # VISUAL will not be set if none of these exist

# handle differences between interactive and non-interactive shells
case $- in

    # interactive
    *i*)
        # initialize GPG key
        export GPG_TTY=$(tty)
	;;

    #not interactive
    *) ;;

esac

