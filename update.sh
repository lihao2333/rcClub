syntaxis()
{
:>main.$1
for file in `ls|grep "\.$1"|grep -v "main"`
do
  echo source ~/rcClub/$file >>main.$1
done
cat main.$1
echo total is `cat main.$1|wc -l`
}
syntaxis bashrc
syntaxis vimrc
echo export RC_ROOT=`pwd`>>main.bashrc
