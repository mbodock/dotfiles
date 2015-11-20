#!/bin/sh

get_git_config () {
    echo "Configurando o Git.."
    echo "Infome seu nome completo"
    read git_username
    echo "informe seu email"
    read git_usermail
}

if [ -d ~/.dotfiles ]; then
    ln -fs ~/.dotfiles/bashrc ~/.bashrc
    ln -fs ~/.dotfiles/config.fish ~/.config/fish/config.fish

    get_git_config
    sed -i "s/name\s=\s.*$/name = $git_username/g" ~/.dotfiles/gitconfig
    sed -i "s/email\s=\s.*$/email = $git_usermail/g" ~/.dotfiles/gitconfig
    ln -fs ~/.dotfiles/gitconfig ~/.gitconfig

    ln -fs ~/.dotfiles/tmux.conf ~/.tmux.conf
    ln -fs ~/.dotfiles/vimrc ~/.vimrc
fi
