# ENVIRONMENT VARIABLE CONFIG
#############################
set -U EDITOR nvim
set -xg ARCHFLAGS "-arch x86_64"
set -xg STARSHIP_CONFIG ~/.config/starship/starship.toml

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# bun
set -g BUN_INSTALL "$HOME/.bun"
set -g PATH "$PATH:$BUN_INSTALL/bin"
#
# remove superflous path repetition until I can find out where it's coming from
set -e PATH[1 2]
# rvm
# WHERE TF IS THIS ALL GETTING AUTOSET?!  AND WHY IS IT SETTING GEM PATH LIKE 3 FKN TIMES?
# All this below seems to be handled by the plugins I've installed for each as uncommenting doubles all their paths.
# Node and GEM are both duplicating themselves in $PATH despite being removed from here and
# bash and zsh and profile rc files being renamed and moved.
# rvm default
# set -xg RVM_PATH "$HOME/.rvm/bin"
# set -xg PATH "$PATH:$RVM_PATH"
# ruby
# set -xg RUBY_PATH "$HOME/.rvm/rubies/ruby-3.2.2/lib/ruby/gems/3.2.0/plugins/"
# set -xg PATH "$PATH:$RUBY_PATH"

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

#FZF tweaks go here 
set fzf_preview_dir_cmd eza --all --color=always
set fzf_diff_highlighter delta --paging=never --width=40
set fzf_fd_opts --hidden --max-depth 3

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

