alias l="ls"
alias c="cd"
alias la="ls -a"
alias py="python"
alias py3="python3"
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
alias ss_bashrc="source ~/.bashrc"
alias ser_http="ifconfig|grep 'inet addr';python -m SimpleHTTPServer"
space2dline()
{
find . -maxdepth 1  -name "* *"   |
while read name; do  
	echo $name
    na=$(echo $name | tr ' ' '_')  
    mv "$name" $na  
done  
}

bx(){ cd `mktemp -d /tmp/sandbox_$1_XXXX`; }
bx_clr(){ /bin/rm /tmp/sandbox* -rf;}
bx_ls(){ ls /tmp|grep sandbox;}

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

alias v="vim"
alias e="evince"

gitall()
{
git add -A
git commit -m "$1"

}
