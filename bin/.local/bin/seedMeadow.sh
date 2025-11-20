~#!/bin/sh

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing from pacman"

sudo pacman -S --noconfirm \
  waybar \
  ghostty \
  docker \
  btop \
  fish \
  pamixer \
  blueberry \
  localsend \
  wiremix \
  navi \
  tldr \
  impala \
  openssh \
  vlc \
  wl-clipboard \
  nerd-fonts

echo "Installation complete for official repository packages."
echo ""
echo "Installing from yay"

yay -S \
  zoxide
#visual-studio-code-bin

if command -v fish &>/dev/null; then
  chsh -s $(which fish)
  echo "shell changed to fish, log out and back in to apply change"
else
  echo "error fish not installed"
fi
