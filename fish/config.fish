# ENVIRONMENT VARIABLE CONFIG
#############################
set -U EDITOR nvim
set -xg ARCHFLAGS "-arch x86_64"

# [ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
# my favorite 'woopsie' slash undo or 'I meant to do' app of ALL time.
# Theydies Laydies Gaydies and Gentlemanz, I present to you,
# thefuck https://archlinux.org/packages/extra/any/thefuck/
# TODO Make this work with fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# bun
set -xg BUN_INSTALL "$HOME/.bun"
set -xg PATH "$PATH:$BUN_INSTALL/bin"
#
# rvm
# All this below seems to be handled by the plugins I've installed for each as uncommenting doubles all their paths.
# rvm default
# set -xg RVM_PATH "$HOME/.rvm/bin"
# set -xg PATH "$PATH:$RVM_PATH"
# ruby
# set -xg RUBY_PATH "$HOME/.rvm/rubies/ruby-3.2.2/lib/ruby/gems/3.2.0/plugins/"
# set -xg PATH "$PATH:$RUBY_PATH"
# gems
# set -xg GEM_PATH "$HOME/.rvm/gems/ruby-3.2.2@global/"
# set -xg PATH "$PATH$GEM_PATH"

# PLUGIN CONFIG
###############
# Tacklebox Plugin
# PREPARE Tackle before taking off with your Tacklebox!
# i.e. don't try to configure tackle below the line where you take off with
# the tacklebox. kek

set tacklebox_path ~/.config/fish/.tackle
set tacklebox_modules virtualfish virtualhooks
set tacklebox_plugins extract grc pip python up
set tacklebox_theme entropy
# NO mo tackle setup after this shipit dot gif
source ~/.config/fish/.tacklebox/tacklebox.fish

#FZF tweaks go here this may or may not be applying correctly, sourcing this config does
#not seem to work
set fzf_preview_dir_cmd eza --all --color=always
set fzf_diff_highlighter delta --paging=never --width=40
set fzf_fd_opts --hidden --max-depth 3
#
# Fundle Plugin
# Like Tacklebox, you must declare fundle plugins before you initalize
fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/oh-my-fish-core'
# stage all plugins BEFORE init
fundle init
# ALIAS / ABBREVIATIONS transition away from alias
##################################################
source ~/.config/.bash_aliases # TODO:old bash trash to eventually clean up to abbreviations like those below it
abbr -a gs lazygit
abbr -a j z
#
#
# PROMPT CONTROL
################
starship init fish | source

