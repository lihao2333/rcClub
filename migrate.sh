files=`ls base* hub.sh`
if [ $# -ne 1 ]
	then 
		echo stubid you are! whats the branch name?
	else
		git checkout $1
		git checkout master $files
fi
