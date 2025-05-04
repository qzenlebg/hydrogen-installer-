#!/bin/bash

set -e

HYDROGEN_INSTALLER_URL="https://0ai4bbbahf.ufs.sh/f/4fzhZqSSYIjme8nkZk9y0UflxtsNqcMFmBaWnDgAEL7kuGvh"

HYDROGEN_M_URL="https://0ai4bbbahf.ufs.sh/f/4fzhZqSSYIjm0dhn4ITNIGxi3T1AmOMrFlpBstKy2nubzCQU"

ROBLOX_URL_ARM="https://setup.rbxcdn.com/mac/arm64/version-0a300062a4794ae6-RobloxPlayer.zip"
ROBLOX_URL_X86="https://setup.rbxcdn.com/mac/version-0a300062a4794ae6-RobloxPlayer.zip"

TMP_DIR="/tmp"
INSTALLER_BIN="$TMP_DIR/hydrogen_installer"

info() {
  echo "[*] $1"
}

error_exit() {
  echo "Error: $1" >&2
  exit 1
}

success() {
  echo "[✔] $1"
}

# 1. Download the Rust installer binary
info "Downloading Hydrogen installer..."
curl -fsSL "https://0ai4bbbahf.ufs.sh/f/4fzhZqSSYIjme8nkZk9y0UflxtsNqcMFmBaWnDgAEL7kuGvh" -o "/tmp/hydrogen_installer"
chmod +x "/tmp/hydrogen_installer"

# 2. Run it with the appropriate arguments
info "Running installer..."
"/tmp/hydrogen_installer" \
  --hydrogen-url "https://0ai4bbbahf.ufs.sh/f/4fzhZqSSYIjm0dhn4ITNIGxi3T1AmOMrFlpBstKy2nubzCQU" \
  --roblox-url-arm "https://setup.rbxcdn.com/mac/arm64/version-0a300062a4794ae6-RobloxPlayer.zip" \
  --roblox-url-x86 "https://setup.rbxcdn.com/mac/version-0a300062a4794ae6-RobloxPlayer.zip"

# 3. Clean up
info "Cleaning up installer binary..."
rm -f "/tmp/hydrogen_installer"

# 4. Done
success "Hydrogen-M installed successfully!"
echo "Enjoy the experience! Please provide feedback to help us improve."
