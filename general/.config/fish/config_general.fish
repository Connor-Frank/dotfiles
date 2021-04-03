# default editor
set -Ux EDITOR vim

# adds !! and !$
function bind_bang
  switch (commandline -t)[-1]
    case "!"
      commandline -t $history[1]; commandline -f repaint
    case "*"
      commandline -i !
  end
end

function bind_dollar
  switch (commandline -t)[-1]
    case "!"
      commandline -t ""
      commandline -f history-token-search-backward
    case "*"
      commandline -i '$'
  end
end

function edit_command_buffer --description 'Edit the command buffer in an external editor'
    set -l f (mktemp)
    if set -q f[1]
        mv $f $f.fish
        set f $f.fish
    else
        # We should never execute this block but better to be paranoid.
        set f /tmp/fish.(echo %self).fish
        touch $f
    end

    set -l p (commandline -C)
    commandline -b > $f
    if set -q EDITOR
        eval $EDITOR $f
    else
        $EDITOR $f
    end

    commandline -r (cat $f)
    commandline -C $p
    command rm $f
end

function fish_user_key_bindings
  bind ! bind_bang
  bind '$' bind_dollar
  bind \cv edit_command_buffer
end
funcsave fish_user_key_bindings

# alias for the "doom" terminal command
alias doom='~/.emacs.d/bin/doom'

# this is an interesting package, if you mess up a command you can type "fuck" in terminal and it guesses at what you meant
thefuck --alias | source

# creates a tmux session named as the current directory and containing two windows
function tmx
  set name (basename $PWD)
  tmux new-session -d -s $name
  tmux new-window -d
  tmux attach-session -d -t $name
end
funcsave tmx

# you can find this script in this repository under "scripts"
alias build-cmake='~/scripts/cmake/build.sh'

# you can find this script in this repository under "scripts"
function run-cmake
  set runfile (~/scripts/cmake/run.sh)
  $runfile $argv[1..-1]
end
funcsave run-cmake

# exa is a cooler ls command that is colored and has file/folder icons
alias show='exa -al --icons --grid'
# my favorite way to run tty-clock
alias clock='tty-clock -s -c -f "%d.%m.%Y"'

# a cool clock i found (https://github.com/joshdk/tty-qlock)
alias textclock='~/sync/scripts/tty-qlock-1.0.0/./dist/qlock -on-color green'

# gets rid of the fish greeting
set fish_greeting
