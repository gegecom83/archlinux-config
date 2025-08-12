#!/bin/bash

# Start mpd service
systemctl --user start --now mpd.service

# Launch xfce4-terminal with rmpc
alacritty -e rmpc

# When rmpc exits, stop mpd service
systemctl --user stop --now mpd.service