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
  openssh

echo "Installation complete for official repository packages."
echo ""
echo "Installing from yay"

yay -S zoxide
