# ENVIRONMENT VARIABLE CONFIG
#############################
set -xg ARCHFLAGS "-arch x86_64"
set -xg STARSHIP_CONFIG ~/.config/starship/starship.toml

#Why is this being injected in the path twice?  HOW is it being injected at all?
set -e PATH[1]

# bun
set -xg BUN_INSTALL $HOME/.bun
set -xg PATH $PATH $BUN_INSTALL/bin
#
# cargo packages
set -xg CARGO_HOME $HOME/.cargo/
set -xg PATH $PATH $CARGO_HOME/bin
set -xg PATH $PATH /usr/local/go
# if status is-interactive
#     eval "$(zellij setup --generate-auto-start fish)"
# end
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
fundle plugin edc/bass
fundle plugin tuvistavie/oh-my-fish-core
# stage all plugins BEFORE init
fundle init

# ALIAS / ABBREVIATIONS transition away from alias
##################################################
# source ~/.config/.bash_aliases # TODO:old bash trash to eventually clean up to abbreviations like those below it
abbr -a gs lazygit
abbr -a j z
abbr -a skype snap run skype
abbr -a hx helix
abbr -a za zellij a
abbr -a lg lazygit
abbr -a vi nvim
abbr -a t task
abbr -a ls eza --long --header --icons --git
abbr -a lsc eza --all --long --header --icons --git --git-ignore
abbr -a cat bat
abbr -a peaclock peaclock --config-dir ~/.config/.peaclock
#
# alias vi='nvim'
# alias t='task'
# alias ls='eza --long --header --icons --git'
# alias lsc='eza --all --long --header --icons --git --git-ignore'
# alias cat='bat'
# alias peaclock='peaclock --config-dir ~/.config/.peaclock'
#
# PROMPT CONTROL
################
starship init fish | source
