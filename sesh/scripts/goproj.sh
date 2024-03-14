#!/usr/bin/env bash
# tmux split-window -v -p 30 "npm run dev"
tmux split-window -v -p 30
tmux send-keys "air -v" Enter
tmux select-pane -t :.+
tmux send-keys "nvim" Enter 
tmux send-keys Space e
