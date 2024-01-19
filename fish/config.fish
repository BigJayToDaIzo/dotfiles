set -U TERM xterm-256color
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
set -xg PATH "$PATH:$BUN_INSTALL/bin"
# rvm
set -xg RVM_PATH "$HOME/.rvm/bin"
set -xg PATH "$PATH:$RVM_PATH"
rvm default
# ruby
set -xg RUBY_PATH "$HOME/.rvm/rubies/ruby-3.2.2/lib/ruby/gems/3.2.0/plugins/"
set -xg PATH "$PATH:$RUBY_PATH"
# gems
set -xg GEM_PATH "$HOME/.rvm/gems/ruby-3.2.2@global/"
set -xg PATH "$PATH$GEM_PATH"

# Tacklebox yo
# PREPARE Tackle before taking off with your Tacklebox!
# i.e. don't try to configure tackle below the line where you take off with
# the tacklebox. kek

set tacklebox_path ~/.config/fish/.tackle
set tacklebox_modules virtualfish virtualhooks
set tacklebox_plugins extract grc pip python up
set tacklebox_theme entropy
# NO mo tackle setup after this shipit dot gif
source ~/.config/fish/.tacklebox/tacklebox.fish

#
# Prompt Improvement Initiative
