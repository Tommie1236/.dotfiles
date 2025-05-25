#!/bin/bash
DOTFILES="$HOME/.dotfiles"

ln -snf $DOTFILES/.config/hypr ~/.config/hypr
ln -snf $DOTFILES/.config/mako ~/.config/mako
ln -snf $DOTFILES/.config/waybar ~/.config/waybar
ln -snf $DOTFILES/.config/nvim ~/.config/nvim
ln -snf $DOTFILES/.config/fish ~/.config/fish
ln -snf $DOTFILES/.config/ly ~/.config/ly

sudo ln -snf $DOTFILES/.config/ly /etc/ly

echo "skipped systemd services. link manually if needed"
# sudo ln -snf $DOTFILES/systemd/user/ly@tty2.service /etc/systemd/system/
# sudo ln -snf $DOTFILES/systemd/user/ly@tty3.service /etc/systemd/system/
