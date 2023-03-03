#!/bin/bash

# Export keymap using keymap-drawer
# (https://github.com/caksoylar/keymap-drawer)


keymap parse -c 10 -z ../config/corne.keymap > corne_keymap.yaml
keymap draw -k crkbd/rev1 corne_keymap.yaml > corne_keymap.svg
rm corne_keymap.yaml
