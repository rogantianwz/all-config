alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

CATALINA_HOME='/opt/tomcat';
alias tmstart='$CATALINA_HOME/bin/startup.sh';
alias tmstartdebug='$CATALINA_HOME/bin/catalina.sh jpda start';
alias tmstop='$CATALINA_HOME/bin/shutdown.sh 2 -force';  
alias tm='cd $CATALINA_HOME';
alias tmconf='vim $CATALINA_HOME/conf/server.xml';
 
alias sck='vim $HOME/sck';

alias ssh44='ssh mdev@192.168.242.44';
alias sshrt='ssh root@rogantian.com'
