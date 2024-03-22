# ENVIRONMENT VARIABLE CONFIG
#############################
#Why is this being injected in the path twice?  HOW is it being injected at all?
# set -e PATH[1]
if status is-login
    # Env Setup
    set -xg ARCHFLAGS "-arch x86_64"
    set -xg STARSHIP_CONFIG ~/.config/starship/starship.toml
    set -xg EDITOR nvim
    set -xg MANPAGER "less -R --use-color -Dd+c -Du+b"
    set -xg MANROFFOPT "-c"
    # Bun
    set -xg BUN_INSTALL $HOME/.bun
    # Cargo packages
    set -xg CARGO_HOME $HOME/.cargo
    # Go shits
    set -xg GOPATH $HOME/go
    # Append path
    set -xg PATH $PATH $CARGO_HOME/bin $BUN_INSTALL/bin $GOPATH/bin

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

function update_system_plz
    yay
    yay -Yc
    yes | yay -Sc
end

function yy
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
#
# ALIAS / ABBREVIATIONS transition away from alias
##################################################
abbr -a cat bat
abbr -a lg lazygit
abbr -a ls eza --long --header --icons --git
abbr -a lsc eza --all --long --header --icons --git --git-ignore
abbr -a peaclock peaclock --config-dir ~/.config/.peaclock
abbr -a sc 'sesh connect $(sesh list | fzf)'
abbr -a sup update_system_plz
abbr -a skype snap run skype
abbr -a t task
abbr -a update update_system_plz
abbr -a vi nvim
abbr -a yazi yy
abbr -a za zellij a
abbr -a zls zellij ls

# PROMPT CONTROL
################
starship init fish | source
