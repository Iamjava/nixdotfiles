if status is-interactive
    # Commands to run in interactive sessions can go here
end

export PATH="/Users/jan.vaorin/.local/bin:$PATH"
export EDITOR=$(which lvim)
fish_vi_key_bindings

set fish_greeting "Its fishy here ...."

abbr k "kubectl"
abbr kget "kubectl config current-context"
abbr kset "kubectl config use-context"
abbr kap "kubectl apply -f "
abbr kapl "kubectl apply -f "
abbr kl "kubectl logs"
abbr kes "kubectl edit secret"

alias vim "lvim"

alias co "git checkout"
alias cl "clear"
alias vi "lvim"
alias rm "trash"
alias v "vi"
alias g "grep"
alias l "less"
alias a "ack"
alias c "cat"
alias sed "gsed"

alias ga "git add ."
alias gp "git push"


abbr fishcfg "vim ~/.config/fish/config.fish"
alias r "ranger"
abbr o "gio open"
alias x "exit"
abbr :q "exit"

fish_vi_cursor

function gc
    set res $(git rev-parse --abbrev-ref HEAD | sed -nE 's,[a-z]+/([A-Z]+-[0-9]+)-.+,\1,p')
    #echo "$res $argv"
    git commit -m"$res $argv"
end



### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/jan.vaorin/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT):w

