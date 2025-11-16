#!/bin/sh

# Check if ghostty is installed
if command -v ghostty >/dev/null 2>&1; then
  exec ghostty "$@"
# Otherwise, fall back to kitty
elif command -v kitty >/dev/null 2>&1; then
  exec kitty "$@"
# If neither is found, exit
else
  echo "Error: Neither ghostty nor kitty was found."
  exit 1
fi
