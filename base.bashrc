alias l="ls"
alias c="cd"
alias la="ls -a"
alias le="less"
alias py="python"
alias py3="python3"
v_source()
{
 vim `which $1`
}
f()
{
echo 1is $1
echo 2is $2
find $2 -name "$1"
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
alias show_gpu="lspci  | grep -i vga"
gbk2utf8()
{
conv -f gbk -t utf8 $1 -o tmp.tmp
mv tmp.tmp $1
}
utf82gbk()
{
iconv -f utf8 -t gbk $1  -o tmp.tmp
mv tmp.tmp $1
}
msp_dbg()
{
mspdebug rf2500
}
msp_trans()
{
echo `pwd`
sed -i "s/ _nop/__nop/g" $1
sed -i "s/      __nop/  __nop/g" $1
sed -i "s/_enable_interrupts/_EINT/g" $1
sed -i "s/_disable_interrupts/_DINT/g" $1
sed -i "s/ _bis_SR_register/__bis_SR_register/g" $1
sed -i "s/      _bis_SR_register/__bis_SR_register/g" $1

}
