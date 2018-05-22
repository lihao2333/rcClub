dkr_rmi()
{
		docker rmi `docker images|grep $1|awk '{print $3}'`
}
alias dkr_ls="docker images "

