#!/bin/bash

# Export keymap using keymap-drawer
# (https://github.com/caksoylar/keymap-drawer)

rm corne_keymap.svg
keymap -c config.yaml parse -c 10 -z ../config/corne.keymap > corne_keymap.yaml
keymap -c config.yaml draw -k crkbd/rev1 -l LAYOUT_split_3x5_3 corne_keymap.yaml > corne_keymap.svg
rm corne_keymap.yaml
