#!/bin/sh

fcitx5 &
hyprpaper &
waybar &

sleep 1
discord &
telegram-desktop -startintray &
firefox &
lxqt-policykit-agent &

aw-server &
aw-watcher-wayfk &
aw-watcher-hyprland &
