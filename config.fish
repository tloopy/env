set termguicolors

set fish_greeting

fish_vi_key_bindings

alias l="ls -al"

alias v="nvim"
alias vim="nvim"
alias v.="v ."
alias vrc="v ~/.vimrc"

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


function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s%s%s > ' \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end
