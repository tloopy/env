# set PYTHON python3

set EDITOR vim

set termguicolors

set fish_greeting

fish_vi_key_bindings

# fish_add_path (go env GOPATH)/bin

alias lac="cd /Volumes/tyler-lacie"
alias vol="cd /Volumes && l"

alias l="ls -al"

alias v="nvim"
alias vim="nvim"
alias v.="v ."
alias vrc="v ~/.config/nvim"

alias fcfg="v ~/.config/fish/config.fish"

alias s="npm run"

alias idfi=". $HOME/esp/esp-idf/export.fish"
alias idfc="idf.py clean"
alias idfb="idf.py build"
alias idffm="idf.py flash monitor"
alias idfef="idf.py erase-flash"
alias idfm="idf.py menuconfig"

alias ycs="yarn clean && yarn start"
alias ys="yarn start"

alias pn="pnpm"

alias gp="git pull"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gch="git checkout"
alias gc="git commit"
alias p="git push"
alias p="git push"
alias gfa="git fetch -a"
alias gba="git branch -a"

alias gpr="gh pr create"
alias gprs="gh pr status"
alias gprv="gh pr view"
alias gprch="gh pr checkout"
alias gcks="gh pr checks"
alias grv="gh repo view"
alias gbr="gh browse"

alias dev="cd ~/development"
alias fun="cd ~/fun"

# alias vol="spotify vol"
alias pause="spotify pause && vol"
alias replay="spotify replay && vol"
alias next="spotify next && vol"

function play
    if count $argv >/dev/null
        spotify play $argv && vol
    else
        spotify play && vol
    end
end

export TERM="xterm-256color"


set -x PATH /opt/homebrew/bin $PATH

# set -x ANDROID_HOME $HOME/Library/Android/sdk
# # set -x ANDROID_SDK_ROOT $HOME/Library/Android/Sdk
# # fish_add_path  $ANDROID_SDK_ROOT/emulator  $ANDROID_SDK_ROOT/platform-tools
# fish_add_path $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools


# function code
#     set location "$PWD/$argv"
#     open -n -b "com.microsoft.VSCode" --args $location
# end

function movephotos
    if count $argv >/dev/null
        set i 0
        for f in *
            set dt $(date -r $f "+%Y-%m-%d_%H%M%S")
            set ext (string split "." -- $f)[2]
            set newname "$dt"___"$f"
            mkdir -p $argv
            cp -v -r -n "$f" "$argv"/"$newname"
        end
    else
        echo please specify destination folder
    end
end

function renamephotos
    set dt $(date '+%Y-%m-%d')
    set i 0
    for f in *
        set ext (string split "." -- $f)[2]
        set newname "$dt"_"$i"."$ext"
        set i (math $i + 1)
        mv -v -n "$f" "$newname"
    end
end

# rbenv init

clear


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /Users/tylerblankenship/miniconda3/bin/conda
#     eval /Users/tylerblankenship/miniconda3/bin/conda "shell.fish" hook $argv | source
# else
#     if test -f "/Users/tylerblankenship/miniconda3/etc/fish/conf.d/conda.fish"
#         . "/Users/tylerblankenship/miniconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH /Users/tylerblankenship/miniconda3/bin $PATH
#     end
# end
# # <<< conda initialize <<<
