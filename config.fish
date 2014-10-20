# filelocation: ~/.config/fish/
# Ajustes de path
set PATH ~/bin/ $PATH
set PATH ~/programs/scripts/ $PATH

# Incluindo SDK do android
set PATH ~/work/.android-sdk/platform-tools $PATH
set PATH ~/work/.android-sdk/tools $PATH
set ANDROID_HOME /home/marcus/work/.android-sdk/
set ANDROID_TOOLS /home/marcus/work/.android-sdk/
set ANDROID_PLATFORM_TOOLS /home/marcus/work/.android-sdk/

set PATH ~/work/.jdk/bin/ $PATH
set JAVA_HOME /home/marcus/work/.jdk/
set ANT_HOME /usr/bin/
set CLASSPATH /home/marcus/work/.jdk/

# Configurando o terminal para 256 cores
set TERM xterm-256color

# Adicionando workon - Deve ser após modificar o path.
. ~/scripts/virtualfish/virtual.fish


# Alias
alias abre="exo-open"
alias temp="watch -n,5 sensors"
alias notas="vim ~/.notes"
alias pyserver="python -m SimpleHTTPServer"

function fuck
    eval sudo $history[1]
end

function jfstart
    cd ~/work/django/JF-server/
    . env/bin/activate.fish
    cd justicafacil
end

# Por fim abre o tmux
# opção -2 para abrir em 256 cores
tmux -2
