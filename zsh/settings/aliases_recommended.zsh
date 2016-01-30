#-------------------
# SAFETY
#-------------------
# Prevents accidentally clobbering files.
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
# If querying the user before executing `rm *' or `rm path/*', first wait ten seconds and ignore anything typed in that time.
setopt rm_star_wait
