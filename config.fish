# filelocation: ~/.config/fish/

# Ajustes de path
set PATH ~/bin/ $PATH
set PATH ~/programs/scripts/ $PATH

# Configurando o terminal para 256 cores
set TERM xterm-256color


# Alias
alias abre="exo-open"
alias temp="watch -n,5 sensors"

# Por fim abre o tmux
# opção -2 para abrir em 256 cores
tmux -2
