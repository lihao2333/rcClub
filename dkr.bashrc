dkr_rmi()
{
		docker rmi `docker images|grep $1|awk '{print $3}'`
}
dkr_rmc_stop()##删除所有终止状态的容器
{
	docker container prune
}
alias dkr_lsi="docker images "
alias dkr_lsc="docker ps"
dkr_help()
{
	echo ---------- 删除 ---------- 
	echo docker container rm  xxx   删除一个终止状态的容器
	echo docker container rm  xxx -f 删除一个运行状态的容器 
	echo docker container prune 	删除所有终止的容器
	echo ---------- 查看 ---------- 
	echo docker ps					查看所有运行中的容器
	echo docker ps -a				查看所有容器
	echo "docker ps |less -S"			用一行列出所有正在运行的容器		
	echo docker ps -l				列出最近一次启动的容器
	echo docker images				列出所有镜像
	echo ---------- 运行 ----------	
	echo "docker run -it xxx /bin/bash"	启动容器并且通过交互式的方式运行
	echo "docker run -it -v /path/to/A:/path/to/B/ xxx  bin/bash"	启动容器并且通过交互式的方式运行, 把本地路径A挂载到容器中的路径B
	echo "docker run -it --rm xxx /bin/bash"	启动容器并且通过交互式的方式运行, 退出时自动删除容器
	echo docker run -d -it image_name 	启动容器请且通过后台方式运行
	echo -w /path	指定进入容器后的路径
	echo ---------- 停止,启动,杀死,重启 ----------	
	echo docker stop/start/kill/restart xxx
	echo ---------- 插入 ----------	
	echo docker attach xxx 		附着到运行中的容器
	echo docker exec -ti xxx /bin/bash  进入正在运行的容器的内部, 同时运行bash 比attach更好用
}
