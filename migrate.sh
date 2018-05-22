files=`ls|grep -v migrate.sh`
git checkout $1
git checkout master $files
