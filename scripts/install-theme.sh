#!/usr/bin/env bash
set -euo pipefail

# macOS Windows 11 Theme installer
# Applies a few simple UI tweaks to make macOS feel more like Windows 11.

if [[ "$(uname)" != "Darwin" ]]; then
  echo "This installer only works on macOS."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
WALLPAPER_PATH="${REPO_ROOT}/assets/wallpapers/windows11-aurora.svg"

if [[ ! -f "${WALLPAPER_PATH}" ]]; then
  echo "Wallpaper asset not found: ${WALLPAPER_PATH}"
  exit 1
fi

echo "Applying Windows 11-inspired macOS theme..."

# Apply a flatter, simpler Dock
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "show-process-indicators" -bool true
defaults write com.apple.dock "show-recents" -bool false
defaults write com.apple.dock "mineffect" -string "genie"
defaults write com.apple.dock "tilesize" -int 42
defaults write com.apple.dock "autohide" -bool true
defaults write com.apple.dock "magnification" -bool false

# Make the interface less translucent and cleaner
defaults write NSGlobalDomain "AppleReduceDesktopTinting" -bool true
defaults write NSGlobalDomain "AppleFontSmoothing" -int 2

# Set wallpaper using a desktop script.
# The file is SVG, so we convert it to a PNG first for best compatibility.
PNG_OUT="${HOME}/Pictures/windows11-aurora.png"
mkdir -p "${HOME}/Pictures"
if command -v rsvg-convert >/dev/null 2>&1; then
  rsvg-convert -w 2880 -h 1800 "${WALLPAPER_PATH}" -o "${PNG_OUT}"
elif command -v inkscape >/dev/null 2>&1; then
  inkscape "${WALLPAPER_PATH}" --export-type=png --export-filename="${PNG_OUT}" >/dev/null 2>&1
else
  echo "Warning: no SVG converter found. Wallpaper remains as a vector file in the repo."
  echo "You can set it manually in System Settings > Wallpaper."
fi

if [[ -f "${PNG_OUT}" ]]; then
  osascript -e 'tell application "System Events" to set picture of every desktop to POSIX file "'"${PNG_OUT}"'"'
fi

killall Dock

echo "Theme applied!"
echo "Open System Settings > Appearance to fine-tune colors and transparency."
