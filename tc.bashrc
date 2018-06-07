tcgen()
{
	if [ $# -ne 1 ]
	then
		echo "input error"
	elif [ -d $1 ] || [ -f $1 ]
	then
		echo $1 exsit
	else
		mkdir $1
		cd $1
		cp /home/geek/Proj/homework/TC_sys_simulation/TP_TC/* . -R
	fi

}
