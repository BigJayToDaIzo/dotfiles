#!/usr/bin/env bash
# tmux split-window -v -p 30 "npm run dev"
tmux split-window -v -p 30
tmux select-pane -t :.+
tmux send-keys "nvim sesh.toml" Enter
# tmux it out from here bois!
