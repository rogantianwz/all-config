alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A' #do not list implied ./ and ../
alias l='ls -CF'

CATALINA_HOME='/opt/tomcat';
alias tmstart='$CATALINA_HOME/bin/startup.sh';
alias tmstartdebug='$CATALINA_HOME/bin/catalina.sh jpda start';
alias tmstop='$CATALINA_HOME/bin/shutdown.sh 2 -force';  
alias tm='cd $CATALINA_HOME';
alias tmconf='vim $CATALINA_HOME/conf/server.xml';
 
alias sck='vim $HOME/sck';
alias ok='vim $HOME/ok';
alias ssh44='ssh mdev@192.168.242.44';
alias sshrt='ssh root@rogantian.com'

#创建一个目录并进入该目录里： mcd [目录名]
mcd() { mkdir -p "$1"; cd "$1"; }

#进入一个目录并列出它的的内容：cls[目录名]
cls() { cd "$1"; ls; }

#进入一个目录并列出它的的内容：cll[目录名]
cll() { cd "$1"; ll; }

#给文件创建一个备份: backup [文件] 
backup() { cp "$1"{,.bak}; }

#md5check[文件][校验值]
md5check() { md5sum "$1" | grep "$2"; }

#使用上一个运行的命令创建一个脚本:makescript[脚本名字.sh]
alias makescript="fc -rnl | head -1 >"

#只是瞬间产生一个强壮的密码
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"

#清楚终端屏幕
alias c="clear"

#迅速搜索历史命令
alias histg="history | grep"

#回到上层目录
alias ..='cd ..'

#回到上两层目录
alias ...='cd ../..'

#解压任何的文档类型
extract() {
    if [ -f $1  ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi

}
 
#System info
#按列格式化输出mount信息
alias cmount="mount | column -t"

#以树形结构递归地显示目录树结构
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

#按照文件再磁盘存储的大小排序,显示当前目录的文件列表
sbs(){ du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e'; }

#接管某个进程的标准输出和标准错误.注意需要安装strace
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p"

#查看还圣夏多少内存
alias meminfo='free -m -l -t'

#带grep的ps
alias ps?="ps aux | grep"

#显示当前音量设置
alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d  ] -f 1"

#Network
#下载整个网站
alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"

#显示哪个应用程序连接到网络
alias listen="lsof -P -i -n"

#显示出活动的端口
alias port='netstat -tulanp'
#gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//' }

#获取本机的公网ip地址和主机名
alias ipinfo="curl ifconfig.me && curl ifconfig.me/host"

#返回当前ip地址的地理位置
getlocation() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\'; }

#Funny
#绘制内核模块依赖曲线图
kernelgraph() { lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -; }

#假神秘
alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""
