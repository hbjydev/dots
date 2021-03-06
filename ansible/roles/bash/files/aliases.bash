# Sudo alias
alias s="sudo"

# systemd-related
alias log="sudo journalctl --output cat -u"
alias log-previous-boot="sudo journalctl --boot=-1"

# Monitoring & process control
alias ports="sudo lsof -Pni"
alias pgrep="pgrep --full"
alias pkill="pkill --full"

# Better LS
alias l="exa -lahF --group-directories-first"
alias ls="exa"

# nvim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias nvim="nvim"

# rsync
alias r="rsync -ra --info=progress2"

# Git Aliases
alias g="git"
alias ga="git add"
alias gau="git add -u"
alias gco="git checkout"
alias gc="git commit --message"
alias gca="git commit --all --message"
alias gs="git status --short"
alias gd="git diff"
alias gdc="git diff --cached"
alias gfr="git pull --rebase"
alias gp="git push"
alias gso="git log -p --all --source -S "

# Better find
alias fd="fd --hidden --exclude .git"

# SSH for any terminal
alias ssh="TERM=xterm-256color ssh"

# Kubernetes Shtuff
alias kc="kubectl"
alias kcw="kubectl -o wide"

# Cool macos-like xdg-open command
if command -v xdg-open &>/dev/null; then
  alias open="xdg-open"
fi
