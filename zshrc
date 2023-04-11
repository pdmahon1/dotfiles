
# shell prompt = current subdirectory + coffee cup
PROMPT=$'%1~/ \U2615\ '


############################################################
# Java, NVM, and Git
############################################################

# setup ssh for git
eval $(ssh-agent) > /dev/null 2>&1
ssh-add > /dev/null 2>&1

export JAVA_HOME=$(/usr/libexec/java_home -v11)

#nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



############################################################
# PATH additions and other exports
############################################################

export PATH=./:$PATH				                        #current directory
export PATH=~/.scripts:$PATH                        #personal scripts
export PATH=~/.npm-global/bin:$PATH                 #node
export PATH=/usr/local/apache-maven-3.8.2/bin:$PATH #maven
export PATH=/usr/local/sbin:$PATH                   #sbin
export PATH=/Users/vacda3/.jfrog/bin:$PATH	        #jfrog
export PATH=$JAVA_HOME/bin:$PATH                    #java



############################################################
# Homebrew
############################################################

export HOMEBREW_NO_ANALYTICS=1

# new stuff needed for pxyrc to work in your home directory
# at the top to ensure it runs
source ~/.scripts/pxyrc  # add this so proxy_* commands are always available



############################################################
# The cherry on top
############################################################
source ~/.secrets
source ~/.aliases
