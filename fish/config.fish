# ENVIRONMENT VARIABLE CONFIG
#############################
#Why is this being injected in the path twice?  HOW is it being injected at all?
# set -e PATH[1]
if status is-login
    # Env Setup
    set -xg ARCHFLAGS "-arch x86_64"
    # set -xg NVIM_APPNAME nvim-kickstart
    set -xg STARSHIP_CONFIG ~/.config/starship/starship.toml
    set -xg EDITOR nvim
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

function nvim_configs_plz
    z kickstart
    nvim init.lua
end
function configs_plz
    z .config
    nvim
end
function projects_plz
    z Projects
    nvim
end

function update_system_plz
    sudo reflector --sort rate -l 5 --save /etc/pacman.d/mirrorlist
    echo fastest mirrors updated!
    yay -Syyu --aur --devel
    sudo pacman -Syu
end
# Figure out how to make-session without attachingnvim_configs_pz
# Figure out how to make these functions lay in the terminals and
# run their appropriate programs
#
function attach_tmux_nvim_config_plz
    tmux new-session -A -s NvimConfig nvim_configs_plz
end

function attach_tmux_configs_plz
    tmux new-session -A -s Configs configs_plz
end
function attach_tmux_projects_plz
    tmux new-session -A -s Projects projects_plz
end

# ALIAS / ABBREVIATIONS transition away from alias
##################################################
abbr -a cat bat
abbr -a hx helix
abbr -a lg lazygit
abbr -a ls eza --long --header --icons --git
abbr -a lsc eza --all --long --header --icons --git --git-ignore
abbr -a peaclock peaclock --config-dir ~/.config/.peaclock
abbr -a skype snap run skype
abbr -a t task
abbr -a tmp attach_tmux_projects_plz
abbr -a tmc attach_tmux_configs_plz
abbr -a tmcn attach_tmux_nvim_config_plz
abbr -a update update_system_plz
abbr -a vi nvim
abbr -a vic nvim_configs_plz
abbr -a za zellij a
abbr -a zls zellij ls

# PROMPT CONTROL
################
starship init fish | source
