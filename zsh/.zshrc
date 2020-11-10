# Initialize zplug
if [ ! -d ~/.zplug ]; then
    git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug 'djui/alias-tips'
zplug 'plugins/autojump', from:oh-my-zsh
zplug 'plugins/command-not-found', from:oh-my-zsh
zplug 'plugins/common-aliases', from:oh-my-zsh
zplug 'lib/completion', from:oh-my-zsh
zplug 'lib/correct', from:oh-my-zsh
zplug 'plugins/copybuffer', from:oh-my-zsh
zplug 'lib/directories', from:oh-my-zsh
zplug 'lib/history', from:oh-my-zsh
zplug 'lib/key-bindings', from:oh-my-zsh
zplug 'hlissner/zsh-autopair'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'

zplug 'junegunn/fzf-bin', from:gh-r, as:command, rename-to:fzf, use:"*linux*amd64*"
zplug 'junegunn/fzf', from:github, use:"shell/*.zsh", defer:2
zplug 'Aloxaf/fzf-tab', defer:2

zplug 'plugins/git', from:oh-my-zsh
zplug 'plugins/gitfast', from:oh-my-zsh
zplug 'wfxr/forgit'

zplug 'plugins/docker', from:oh-my-zsh
zplug 'plugins/extract', from:oh-my-zsh
zplug 'plugins/tmux', from:oh-my-zsh

zplug 'plugins/python', from:oh-my-zsh
zplug 'plugins/pip', from:oh-my-zsh
zplug 'srijanshetty/zsh-pip-completion'

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

# Support true color in terminal emulator
export TERM=screen-24bits

# powerlevel10k custom
# based on https://gitlab.com/shanedora/arch_i3gaps_beach/blob/master/my_zshrc
# and default theme of https://github.com/romkatv/powerlevel10k.

typeset -g POWERLEVEL9K_MODE='nerdfont-complete'

typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
typeset -g POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE_COUNT=1
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='\u2570\uf460 '

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context newline virtualenv dir_writable dir vcs)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs root_indicator history)
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_END_SEPARATOR=
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=" "
typeset -g POWERLEVEL9K_WHITESPACE_BETWEEN_{LEFT,RIGHT}_SEGMENTS=" "

typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=none
typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=14

typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,ROOT,SUDO,REMOTE,REMOTE_SUDO}_BACKGROUND=none
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=15

typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=none
typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=39

typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND=none
typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND=9

typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
typeset -g POWERLEVEL9K_DIR_{ETC,HOME,HOME_SUBFOLDER,DEFAULT,NOT_WRITABLE}_BACKGROUND=none
typeset -g POWERLEVEL9K_DIR_{ETC,HOME,HOME_SUBFOLDER,DEFAULT,NOT_WRITABLE}_FOREGROUND=189

typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED,LOADING}_BACKGROUND=none
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=10
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=14
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=11
typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=244
typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNTRACKEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND
typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNSTAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_INCOMING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_OUTGOING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STASHFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_ACTIONFORMAT_FOREGROUND=1
typeset -g POWERLEVEL9K_VCS_LOADING_ACTIONFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_LOADING_FOREGROUND

typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND=none
typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=none
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=9

typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=none

typeset -g POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=none

typeset -g POWERLEVEL9K_HISTORY_BACKGROUND=none
typeset -g POWERLEVEL9K_HISTORY_FOREGROUND=8

# Set fzf installation directory path
export FZF_BASE=/usr/bin/fzf
export DISABLE_FZF_AUTO_COMPLETION="true"
export FZF_COMPLETION_TRIGGER="**"

# fzf-tab settings
FZF_TAB_COMMAND=(
    fzf
    --ansi
    --expect='$continuous_trigger,$print_query'
    '--color=hl:$(($#headers == 0 ? 108 : 255))'
    --nth=2,3 --delimiter='\0'
    --layout=reverse --height='${FZF_TMUX_HEIGHT:=75%}'
    --tiebreak=begin -m --bind=tab:down,ctrl-j:down,change:top,ctrl-space:toggle --cycle
    '--query=$query'
    '--header-lines=$#headers'
    '--print-query'
)
zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND

# forgit configures
forgit_log=glo
forgit_diff=gd
forgit_add=ga
forgit_reset_head=grh
forgit_ignore=gi
forgit_restore=gcf
forgit_clean=gclean
forgit_stash_show=gss
forgit_cherry_pick=gcp

# Key bindings
bindkey "^K" up-line-or-history
bindkey "^J" down-line-or-history

# Aliases
alias _='sudo '
alias a='clear'
alias c='nvim ~/.zshrc'
alias h='htop'
alias n='neofetch'
alias q='exit'
alias r='source ~/.zshrc'
alias t='sudo ntpdate -u time.nist.gov'
alias v='nvim'
alias xc='xcape -t 150 -e "Control_L=Escape"'
alias y='yay --pacman powerpill'
alias py='python'
alias jl='julia'
alias pp='sudo powerpill'
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
