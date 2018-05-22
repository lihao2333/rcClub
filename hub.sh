files=`ls base*`
if [ $# -ne 1 ]
	then 
		echo pls input current branch name ! 白痴
	else
		git checkout master
		git checkout $1 $files
fi
