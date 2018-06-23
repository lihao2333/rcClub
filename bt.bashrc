alias bt_info="firefox http://my.bupt.edu.cn/detach.portal?.p=Znxjb20ud2lzY29tLnBvcnRhbC5jb250YWluZXIuY29yZS5pbXBsLlBvcnRsZXRFbnRpdHlXaW5kb3d8cGUxMTQ0fHZpZXd8bm9ybWFsfGdyb3VwaWQ9MTgzMjAyMDAwJmdyb3VwbmFtZT3mlZnliqHlpIQmYWN0aW9uPWJ1bGxldGluUGFnZUxpc3Q_"
alias bt_edu="firefox http://jwxt.bupt.edu.cn/jwLoginAction.do"
alias bt_login="byrlogin"
bt_gen()
{
if [[ $# -ne 1 ]];then
 echo "pls input project name"
elif [[  -f $1 ]]; then
	echo file exists
elif [[  -d $1 ]]; then
	echo dir exists
else
	mkdir $1
	cd $1
	cp /home/geek/Proj/TP_BUPT/* . -R
fi
}
