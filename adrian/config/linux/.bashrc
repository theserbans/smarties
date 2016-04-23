# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
alias rm='rm -Iv'
alias cp='cp -iv'
alias mv='mv -iv'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
#
# Misc :)
#alias less='less -r'               # raw control characters
alias whence='type -a'              # where, of a sort
alias grep='grep --color'           # show differences in colour
alias egrep='egrep --color=auto'    # show differences in colour
alias fgrep='fgrep --color=auto'    # show differences in colour
alias tree='tree -CsDh'             #  Nice alternative to recursive ls ...

# The 'ls' family (this assumes you use a recent GNU ls).
# -------------------------------------------------------------
alias ls='ls --color'
alias l='ls --group-directories-first --color -CF'    #
alias ll='ls -h --group-directories-first --color -l' 		# Add colors for filetype and  human-readable sizes by default on ls:
alias la='ls -h --group-directories-first --color -lA' 		# Sort all by name.
alias lx='ls -h --group-directories-first --color -lXB' 		#  Sort by extension.
alias lk='ls -h --group-directories-first --color -lSr' 		# by size, biggest last.
alias lt='ls -h --color -ltr' 		#  Sort by date, most recent last.
alias lu='ls -h --color -ltur' 		# Sort by/show access time,most recent last.
alias lc='ls -h --color -ltcr' 		#  Sort by/show change time,most recent last.
alias lct='ls -h --color -ltcr | tail' 	#  Sort by/show change time,most recent last -- tailed.

# The ubiquitous ll: directories first, with alphanumeric sorting:
# -------------------------------------------------------------
alias lls='ls -gv --group-directories-first --color|less -R'    #  Pipe through less
alias llr='ls -gv --group-directories-first --color -R'         #  Recursive ls.
alias lla='ls -gv --group-directories-first --color -A'         #  Show hidden files.

# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..

# Tailoring less
# -------------------------------------------------------------
# Preserve color
alias less='less -R'
alias more='less'
set PAGER=less

# Tailoring cgywin
# -------------------------------------------------------------
export nodosfilewarning=true
export LC_ALL=en_US.UTF-8

# todo
# -------------------------------------------------------------
alias todo='todo -d /mnt/r/todo.cfg'
alias todow='todo -d /mnt/r/work/todo.cfg'
alias todoa='todo -d /mnt/r/ea/todo.cfg'
alias tobuy='todo -d /mnt/r/adi/tobuy.cfg'
complete -F _todo todo
complete -F _todo todow
complete -F _todo todoa
complete -F _todo tobuy

# misc
# -------------------------------------------------------------
alias mtail='multitail'
# eval 'dircolors' ~/.dir_colors
eval "$(dircolors -b ~/.dir_colors)"

cdl () {
    cd "$*"
    l
}

# fedora
# -------------------------------------------------------------
alias sc='systemctl'

PS1='\[\e]0;\w\a\]\n\[\e[01;31m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
# PS1='\[\e]0;\w\a\]\n\[\e[00;33m\]\u@\h \[\e[35m\]\w\[\e[0m\]\n\$ '

