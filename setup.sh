#!/usr/bin/env sh

RAW_DOOMEMACS_SETTINGS_URL="https://raw.githubusercontent.com/chubbyhippo/doomemacs-settings/refs/heads/main/.config/doom"

curl -ksS "$RAW_DOOMEMACS_SETTINGS_URL/config.el" -o $HOME/.config/doom/config.el
curl -ksS "$RAW_DOOMEMACS_SETTINGS_URL/init.el" -o $HOME/.config/doom/init.el
