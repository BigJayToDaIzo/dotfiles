#!/usr/bin/env bash
tmux split-window -v -p 30
tmux select-pane -t :.+
tmux send-keys "nvim alacritty.toml" Enter
