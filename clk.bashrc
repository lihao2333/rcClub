clk()
{
   sec=$(echo $1*60*1000|bc)
	echo $sec
	notify-send "Time alert!" "Time done" -t $sec

}

