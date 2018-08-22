# filelocation: ~/.config/fish/
# Ajustes de path
set PATH ~/bin/ $PATH
set PATH ~/.cargo/bin/ $PATH
set PATH ~/scripts/ $PATH
set PATH ~/Programs/ $PATH
set PATH ./node_modules/ $PATH

# Incluindo SDK do android
set PATH ~/work/.android-sdk/platform-tools $PATH
set PATH ~/work/.android-sdk/tools $PATH
set PATH ~/work/.android-sdk/build-tools/20.0.0 $PATH
set ANDROID_HOME /home/marcus/work/.android-sdk/
set ANDROID_TOOLS /home/marcus/work/.android-sdk/
set ANDROID_PLATFORM_TOOLS /home/marcus/work/.android-sdk/

set PATH ~/work/.jdk/bin/ $PATH
set JAVA_HOME /home/marcus/work/.jdk/
set ANT_HOME /usr/bin/
set CLASSPATH /home/marcus/work/.jdk/

# Configurando o terminal para 256 cores
set TERM xterm-256color

# Desligando Pycache
set PYTHONDONTWRITEBYTECODE 1
# Warnings DBUS
set NO_AT_BRIDGE 1

# Adicionando workon - Deve ser após modificar o path.
. ~/bin/fishenv/fishenv.fish


# Alias
alias abre="exo-open"
alias cv="xclip -se c"
alias notas="vim ~/.notes"
alias pyserver="python -m SimpleHTTPServer"
alias temp="watch -n,5 sensors"
alias usage="du -sh * | sort -h | tac"
alias vimdiff="vim (git s | egrep -e '^ M|^\?\?' | egrep -v -e '\/\$' | sed -r 's/\?\?/ M/g' | cut -d' ' -f 3) -p"

function fuck
    eval sudo $history[1]
end

function mkcd
    mkdir $argv
    cd $argv
end

# Configurar git no fish
set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  if test -d .git
    printf '%s@%s %s%s%s:%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
  else
    printf '%s@%s %s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end


# TurnOn pyenv
set -x PATH "/home/mbodock/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

# Por fim abre o tmux
# opção -2 para abrir em 256 cores
tmux -2
