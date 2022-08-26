# ~/.zshrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

export EDITOR='nvim'
export VISUAL='nvim'
export READER='zathura'
export TERMINAL='alacritty'
export SUDO_ASKPASS="$HOME/.local/bin/askpass"
export QT_QPA_PLATFORM=xcb
export TUIR_BROWSER='mpv'
export QT_QPA_PLATFORMTHEME='qt5ct'
export NNN_COLORS="2136"
# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zhistory
autoload -U colors && colors
setopt autocd # Automatically cd into typed directory.
setopt interactive_comments

# ZSH completion
autoload -U compinit
zstyle ':completion:*' menu select
_comp_options+=(globdots) # Show hidden files.
zmodload zsh/complist
compinit

# VI Mode
bindkey -v
#

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#list
alias ls='exa -a --color=always --group-directories-first'
alias la='exa -al --color=always --group-directories-first'

#cat
alias cat='bat'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#other aliases
alias p='sudo pacman'
alias nv="nvim"
alias SS='sudo systemctl'

#swayhide aliases
alias zathura='swayhide zathura'
alias imv='swayhide imv'
alias sxiv='swayhide sxiv'
alias qpwgraph='swayhide qpwgraph'
alias firefox='swayhide firefox'
alias audacity='swayhide audacity'
alias inkscape='swayhide inkscape'
alias mpv='swayhide mpv'

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"


## EXTRACT
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

IFS=$SAVEIFS

####-START STARSHIP SHELL-####
eval "$(starship init zsh)"

####-PFETCH-####
export PF_COL1=3
export PF_COL3=3

pfetch

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=#d79921,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=#d79921,bold
ZSH_HIGHLIGHT_STYLES[arg0]=fg=#d79921,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=#d79921,bold
ZSH_HIGHLIGHT_STYLES[root]='bg=red'
ZSH_HIGHLIGHT_STYLES[path]='fg=#d79921'
