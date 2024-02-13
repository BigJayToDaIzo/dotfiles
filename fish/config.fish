# ENVIRONMENT VARIABLE CONFIG
#############################
#Why is this being injected in the path twice?  HOW is it being injected at all?
# set -e PATH[1]
if status is-login
    set -xg ARCHFLAGS "-arch x86_64"
    set -xg STARSHIP_CONFIG ~/.config/starship/starship.toml
    set -xg BUN_INSTALL $HOME/.bun
    set -xg PATH $PATH $BUN_INSTALL/bin
    #
    # cargo packages
    set -xg CARGO_HOME $HOME/.cargo/
    set -xg PATH $PATH $CARGO_HOME/bin
    # Go
    set -xg GOBIN /usr/local/go/bin
    set -xg PATH $PATH $GOBIN

    # PLUGIN CONFIG
    ###############
    # Tacklebox Plugin
    # PREPARE Tackle before taking off with your Tacklebox!
    # i.e. don't try to configure tackle below the line where you take off with
    # the tacklebox. kek
    set -xg tacklebox_path ~/.config/fish/.tackle
    set -xg tacklebox_modules virtualfish virtualhooks
    set -xg tacklebox_plugins extract grc pip python up
    set -xg tacklebox_theme entropy
    # NO mo tackle setup after this shipit dot gif
    source ~/.config/fish/.tacklebox/tacklebox.fish

    #FZF tweaks go here 
    set -xg fzf_preview_dir_cmd eza --all --color=always
    set -xg fzf_diff_highlighter delta --paging=never --width=40
    set -xg fzf_fd_opts --hidden --max-depth 3

    # Fundle Plugin
    # Like Tacklebox, you must declare fundle plugins before you initalize
    fundle plugin edc/bass
    fundle plugin tuvistavie/oh-my-fish-core
    # stage all plugins BEFORE init
    fundle init

end

if not status is-login
    eval "$(zellij setup --generate-auto-start fish)"
end

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
abbr -a zls zellij ls

# PROMPT CONTROL
################
starship init fish | source
