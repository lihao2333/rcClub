djgo_help()
{
	--创建
	echo django-admin startproject xxx	创建名为xxx的工程
	echo django-admin startapp xxx	创建名为xxx的app
	--运行
	echo python3 manage.py runserver 0.0.0.0:8000　运行工程，不设置防火墙，开放在8000端口
	echo python3 manage.py shell 通过shell来运行
	--管理员
	echo python3 manage.py createsuperuser 创建超级用户名且输入用户名和密码
	--迁移
	echo python3 magane.py migrate
	--Model
	echo python3 manage.py makemigrations TestModel  申明模型变更
	echo python3 manage.py migrate TestModel  申明模型变更
}
alias djgo_run="python3 manage.py runserver 0.0.0.0:8000"
