# Source global definitions
if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

source ~/.bash/common
source ~/.bash/docker
source ~/.bash/history
source ~/.bash/elm
source ~/.bash/prompt
source ~/.bash/bin
source ~/.bash/git
source ~/.bash/rvm
source ~/.bash/nvm
source ~/.bash/ruby
source ~/.bash/screen

if [ "$(domainname)" = "NEOPOLY" ]; then
  source ~/.bash/neopoly
else
  source ~/.bash/private
fi

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/opt/home/as/devel/nit/bin
source /opt/home/as/devel/nit/bin/nit.completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
