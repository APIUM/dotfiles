# .zshrc

# Command completion
# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/apium/.zshrc'
autoload -Uz compinit && compinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# prompt init
autoload -Uz promptinit && promptinit
prompt walters

# colors
autoload -U colors && colors

# alias
alias ls='ls --color=auto'

# default user
#DEFAULT_USER=`$USER`

# persistant rehash
zstyle ':completion:*' rehash true

# path for ruby gems
export PATH=$PATH:/home/apium/.gem/ruby/2.4.0/bin

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh
