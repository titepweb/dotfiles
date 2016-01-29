alias mkdir='mkdir -p'
alias md='mkdir --parents'

#-------------------
# SAFETY
#-------------------
# Prevents accidentally clobbering files.
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
# If querying the user before executing `rm *' or `rm path/*', first wait ten seconds and ignore anything typed in that time.
setopt rm_star_wait

#-------------------
# CONVENIENCE
#-------------------
# Easier navigation:
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."


# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

#-------------------
# BRIEF
#-------------------
alias -g L=' | less'
alias -g M=' | less'
alias -g H=' | head'
alias -g T=' | tail'
alias -g G=' | grep'

