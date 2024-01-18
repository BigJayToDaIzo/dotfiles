set -U EDITOR nvim
set -xg ARCHFLAGS "-arch x86_64"

source ~/.config/.bash_aliases
[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
# my favorite 'woopsie' slash undo or 'I meant to do' app of ALL time.
# Theydies Laydies Gaydies and Gentlemanz, I present to you,
# thefuck https://archlinux.org/packages/extra/any/thefuck/
# TODO Make this work with fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# bun
set -xg BUN_INSTALL "$HOME/.bun"
set -xg PATH "$BUN_INSTALL/bin:$PATH"



# TODO Where are my gem paths?
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
set -xg PATH "$PATH:$HOME/.rvm/bin"

# Prompt Improvement Initiative

