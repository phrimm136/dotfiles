# Initialize zplug
if [ ! -d ~/.zplug ]; then
    git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug 'lib/completion', from:oh-my-zsh
zplug 'lib/correction', from:oh-my-zsh
zplug 'lib/directories', from:oh-my-zsh
zplug 'lib/history', from:oh-my-zsh
zplug 'lib/key-bindings', from:oh-my-zsh
zplug 'plugins/command-not-found', from:oh-my-zsh
zplug 'plugins/common-aliases', from:oh-my-zsh
zplug 'plugins/copybuffer', from:oh-my-zsh
zplug 'djui/alias-tips'
zplug 'mdumitru/fancy-ctrl-z'
zplug 'hlissner/zsh-autopair'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'

zplug 'plugins/gitfast', from:oh-my-zsh
zplug 'plugins/git', from:oh-my-zsh

zplug 'plugins/docker', from:oh-my-zsh
zplug 'plugins/extract', from:oh-my-zsh
zplug 'plugins/tmux', from:oh-my-zsh

zplug 'plugins/python', from:oh-my-zsh
zplug 'plugins/pip', from:oh-my-zsh
zplug 'srijanshetty/zsh-pip-completion'

zplug 'junegunn/fzf', from:github, use:"shell/*.zsh", defer:2
zplug 'Aloxaf/fzf-tab', defer:2

zplug "romkatv/powerlevel10k", as:theme

if ! zplug check; then
    zplug install
fi

zplug load

# Add ~/.local/bin to PATH
local userbin="$HOME/.local/bin"
if ! [[ $PATH =~ $userbin ]]; then
    export PATH=$userbin:$PATH
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Support true color in terminal emulator - disabling due to malfunctioning home and end key
# export TERM=screen-24bits

# Load powerlevel10k custom
source ~/.p10k.zsh

# Set fzf installation directory path
export FZF_BASE=/usr/bin/fzf
export DISABLE_FZF_AUTO_COMPLETION="true"
export FZF_COMPLETION_TRIGGER="**"
bindkey "^f" fzf-cd-widget
bindkey -r "\ec"

# fzf-tab settings
setopt globdots
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' show-group full

# zoxide configures
eval "$(zoxide init zsh)"

# Key bindings
bindkey "^K" up-line-or-beginning-search
bindkey "^J" down-line-or-beginning-search

# Aliases
alias _='sudo '
alias b='btm'
alias c='nvim ~/.zshrc'
alias n='neofetch'
alias l='exa -lFh'
alias q='exit'
alias r='source ~/.zshrc'
alias t='sudo ntpdate -u time.nist.gov'
alias v='nvim'
alias y='yay'
alias g='sudo mount /dev/sda2 ~/Games'
alias py='python'
alias jl='julia'
alias pp='sudo pacman'
alias kb='~/.config/i3/scripts/keyboard.sh'
alias la='exa -alFh'
alias pc='paccache -rk1 && paccache -ruk0 && paccache -rk1 -c ~/.cache/yay/ && paccache -ruk0 -c ~/.cache/yay/'
alias vf='nvim $(fasd -l | fzf)'
alias mtu='sudo ip link set wlp3s0 mtu'
alias mnt='udisksctl mount -b /dev/sdb1'
alias umnt='udisksctl unmount -b /dev/sdb1'

# Aliases for directories
hash -d c=~/.config
hash -d usb=~/media/usb

# texlive path configuration
local texpath="/usr/local/texlive/2019/bin/x86_64-linux"
local texmanpath="/usr/local/texlive/2019/texmf-dist/doc/man"
local texinfopath="/usr/local/texlive/2019/texmf-dist/doc/info"

if ! [[ $PATH =~ $texpath ]]; then
    export PATH="$texpath:$PATH"
fi
if ! [[ $MANPATH =~ $texmanpath ]]; then
    export MANPATH="$texmanpath:$MANPATH"
fi
if ! [[ $INFOPATH =~ $texinfopath ]]; then
    export INFOPATH="$texinfopath:$INFOPATH"
fi
