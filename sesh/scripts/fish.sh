#!/usr/bin/env bash
tmux split-window -v -p 30
tmux select-pane -t :.+
tmux send-keys "nvim config.fish" Enter
tmux send-keys Space e
tmux send-keys C-l
