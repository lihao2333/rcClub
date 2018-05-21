# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@Mark:\[\033[01;34m\]\W\[\033[00m\]\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add to path if not already there
pathadd() {
  echo "Adding $1 to PATH"
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}
# Add to ld_library _path if not already there
ldpathadd() {
  echo "Adding $1 to LD_LIBRARY_PATH"
  if [ -d "$1" ]; then
    if [[ ":$LD_LIBRARY_PATH:" != *":$1:"* ]]; then
      # For non-empty, only add if not already there
      export LD_LIBRARY_PATH="$1:$LD_LIBRARY_PATH"
    fi
  fi
}


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export PATH=$PATH:/home/geek/Scripts
export PATH=$PATH:/home/geek/demoClub/linux/shell
export PATH=$PATH:/home/geek/Repo/Develop/blender/blender-2.79-linux-glibc219-x86_64
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace
source /usr/local/bin/virtualenvwrapper.sh
#export http_proxy=http://localhost:8118
#export https_proxy=https://localhost:8118
export PATH=$PATH:/usr/local/pgsql/bin
export PATH=$PATH:/home/geek/Proj/wechat_web_devtools/bin
export PYTHONPATH=$PYTHONPATH:/home/Proj/tenserflow/models/research:/home/Proj/tenserflow/models/research/slim
export PATH=$PATH:/home/geek/anaconda3/bin
export PYTHONPATH=$PYTHONPATH:~/src/tf-image-segmentation
################rm
alias rm=trash  
alias r=trash  
alias rl='ls /home/Repo/.Trash'
alias ur=undelfile
alias rclear='/bin/rm -rf /home/Repo/.Trash/*'
undelfile()
{
  mv  /home/Repo/.Trash/$@ ./
}
trash()
{
  mv $@ /home/Repo/.Trash/
}
up()
{
	tmp=..   # finally `cd` parameter
	if [ $# -eq 0 ];then 
			cd $tmp
	elif [ $1 -eq 1 ];then
			cd $tmp
	else
			for i in $(seq 2 $1)
			do
					tmp=$tmp/..
			done
			cd $tmp
	fi
	pwd
}

export QSYS_ROOTDIR="/home/Proj/Intel/Install/quartus/sopc_builder/bin"
export PATH=$PATH:/home/Proj/Intel/Install/Quartus/quartus/bin
export QUARTUS_ROOTDIR=/home/geek/Proj/Intel/Install/Quartus/quartus
#export PATH=$PATH:/home/Proj/ElectroPK/DevelpTools/msp430-6.4.3/msp430-gcc-6.4.0.32_linux64/bin
alias dj_run="python3 manage.py runserver 0.0.0.0:8000"

alias go_intel='cd /home/Proj/Intel'
alias go_cubr='cd /home/geek/Proj/M_cubeRecover/demo/cubr'
alias go_cuberecover='cd /home/geek/Proj/M_cubeRecover'
alias go_devlelop="cd /home/geek/Repo/Develop"
alias go_elecpk="cd /home/geek/Proj/ElectroPK"

alias ss_bashrc="source ~/.bashrc"

alias sl="ls"
alias l="ls"

alias ser_http="ifconfig|grep 'inet addr';python -m SimpleHTTPServer"

alias clgo_hld='cd /home/Proj/Intel/Install/hld'
alias clsource=" source /home/Proj/Intel/Install/hld/init_opencl.sh "
alias clsource_cpl="source /home/Proj/Intel/Install/embedded/embedded_command_shell.sh"
alias clrun_emulate="CL_CONTEXT_EMULATOR_DEVICE_ALTERA=1 ./host "
alias clcpl_corss="aoc -report --board c5p"
alias clcpl_emulator="aoc -march=emulator"

clchange_board()
{
	export AOCL_BOARD_PACKAGE_ROOT="$INTELFPGAOCLSDKROOT/board/$1"
	cl_source
}

alias msp_gdb="msp430-gdb"
. /home/geek/torch/install/bin/torch-activate
. /home/geek/torch/install/bin/torch-activate

dkr_rmi()
{
		docker rmi `docker images|grep $1|awk '{print $3}'`
}
alias dkr_ls="docker images "
alias cv_cpl="g++ `pkg-config --cflags opencv`  $1 `pkg-config --libs opencv`"
alias cpl_11=" g++ -std=c++11 $1"
alias tcgo_class="cd /home/geek/Proj/class/通信系统与仿真"
alias tcgo_homewk="cd /home/geek/Proj/homework/TC_sys_simulation/10th_kuopin"
tcgen()
{
	mkdir "$1"
	cd "$1"
	cp /home/geek/Proj/homework/TC_sys_simulation/TP_TC/* . -R
}
bupt_gen()
{
	mkdir "$1"
	cd "$1"
	cp /home/Proj/TP_BUPT/* . -R
}
alias elego_16="cd /home/geek/Proj/ElectroPK/ElectronPK/2016"
alias elego_doc="cd /home/geek/Proj/ElectroPK/ElectronPK/doc"
alias elego_demo="cd /home/geek/Proj/ElectroPK/demos"
alias elego_note="cd /home/geek/Proj/ElectroPK/ElectronPK/doc/note"
space2dline()
{
find . -maxdepth 1  -name "* *"   |
while read name; do  
	echo $name
    na=$(echo $name | tr ' ' '_')  
    mv "$name" $na  
done  
}
alias go_sandbox="cd /home/geek/Sandbox"
bx(){ cd `mktemp -d /tmp/sandbox_$1_XXXX`; }
bx_clr(){ /bin/rm /tmp/sandbox* -rf;}
bx_ls(){ ls /tmp|grep sandbox;}
alias go_jiwang="cd /home/geek/Proj/C_jiwang/report"
imgk_negate(){ convert -negate $1 $1; }
export PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-linux
font_install()
{
sudo mkdir -p /usr/share/fonts/windows
sudo cp `ls|grep ttf` /usr/share/fonts/windows
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv
}
alias font_show="fc-list "
alias font_showzh="fc-list :lang=zh"
alias font_fresh="fc-cache"

alias go_sdr="cd /home/geek/Proj/M_rtlsdr"
alias c="cd"
alias qq="/home/geek/Repo/Chat/QQ-20171129-x86_64.AppImage "
alias matlab="matlab -nodesktop"
alias portalgo_list="cd /var/www/html/portal/table/list"
alias portalupdate="/var/www/html/portal/table/update.sh 2>/dev/null"
alias go_mooc="cd /home/geek/Proj/MOOC/data1/log 活动日志/00720091_1.log"
alias show_gpu="lspci  | grep -i vga"

gcc_gen()
{
	mkdir "$1"
	cd "$1"
	cp /home/geek/Proj/TP_GCC/* . -R
}
alias v="vim"
alias e="evince"
alias dev_ls="ls /media/geek"
dev_go()
{
	cd /media/geek/$1
}
