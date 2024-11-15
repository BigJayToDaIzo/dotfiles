# ENVIRONMENT VARIABLE CONFIG
############################
if status is-login
    # Env Setup
    set -xg ARCHFLAGS "-arch x86_64"
    set -xg STARSHIP_CONFIG ~/.config/starship/starship.toml
    set -xg EDITOR nvim
    set -xg MANPAGER "less -R --use-color -Dd+c -Du+b"
    set -xg MANROFFOPT "-c"
    set -xg ELECTRON_OZONE_PLATFORM "wayland"
    set -xg LOCALSCRIPTS ~/.local/scripts/
    set -xg CARGO_MOMMYS_MOODS "chill/ominous/thirsty/yikes"
    set -xg CARGO_MOMMYS_PARTS "delicious booty/juicy peach"
    # Bun
    set -xg BUN_INSTALL $HOME/.bun
    # Cargo packages
    set -xg CARGO_HOME $HOME/.cargo
    # Go shits
    set -xg GOPATH $HOME/go
    # Lua shits
    set -xg LUAPATH $HOME/.luarocks
    source /opt/asdf-vm/asdf.fish
    # Append path
    set -xg PATH $PATH $CARGO_HOME/bin $BUN_INSTALL/bin $GOPATH/bin $LUAPATH/bin $LOCALSCRIPTS
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

    #FZF tweaks go here
    set -xg fzf_preview_dir_cmd eza --all --color=always
    set -xg fzf_diff_highlighter delta --paging=never --width=40
    set -xg fzf_fd_opts --hidden --max-depth 3

    # Like Tacklebox, you must declare fundle plugins before you initalize
    fundle plugin edc/bass
    fundle plugin tuvistavie/oh-my-fish-core
    # stage all plugins BEFORE init
    fundle init

end
#
# ALIAS / ABBREVIATIONS transition away from alias
##################################################
abbr -a cat bat
function ed
    set track (pwd | rg '.*/exercism/(.+)?/' -or '$1')
    command exercism download --track=$track --exercise=$argv[1]
    cd .. && cd $argv[1]
end
function gbe
    cd ..
    mkdir $argv[1]
    cd $argv[1]
    go mod init example.com/$argv[1]
    touch $argv[1].go
end
function gtcr
    go test -coverprofile coverage.out -v
    go tool cover -html=coverage.out
end
function shipit
    set track (pwd | rg '.*/exercism/(.+)/.*' -or '$1')
    $track test && exercism submit
end
abbr -a ls eza --long --header --icons --git
abbr -a lsc eza --all --long --header --icons --git --git-ignore
abbr -a peaclock peaclock --config-dir ~/.config/peaclock
function pt
    python -m pytest -o markers=task -x --ff $argv[1]
end
abbr -a skype snap run skype
abbr -a sup topgrade
abbr -a t 'clear && task'
abbr -a ta task
abbr -a vi nvim
abbr -a y yy
abbr -a yazi yy
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
abbr -a za zellij a
function zd
    command zellij delete-session $argv[1] --force
end
abbr -a zda zellij delete-all-sessions --force
abbr -a zls zellij ls
function zs
    command zellij attach --create $argv[1] options --default-layout $argv[1]
end



# PROMPT CONTROL
################
starship init fish | source
source ~/.config/fish/.tacklebox/tacklebox.fish
