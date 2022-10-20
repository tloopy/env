set termguicolors

set fish_greeting

fish_vi_key_bindings

alias l="ls -al"

alias v="nvim"
alias vim="nvim"
alias v.="v ."
alias vrc="v ~/.vimrc"

alias fcfg="v ~/.config/fish/config.fish"

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

alias vol="spotify vol"
alias pause="spotify pause && vol"
alias replay="spotify replay && vol"
alias next="spotify next && vol"

function play
    if count $argv > /dev/null
        spotify play $argv && vol
    else
        spotify play && vol
    end
end

export TERM="xterm-256color"


function clonetcam
    if count $argv > /dev/null
        gh repo clone Tactacam-LLC/$argv
    end
end

function clone
    if count $argv > /dev/null
        gh repo clone $argv
    end
end

set BROWSER firefox
