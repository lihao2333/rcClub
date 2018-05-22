alias rm=trash  
alias rl='ls /home/Repo/.Trash'
alias ur=undelfile
alias rclear='/bin/rm -rf /home/Repo/.Trash/*'
undelfile()
{
  mv  /home/Repo/.Trash/$@ ./
}
trash()
{
  mv $@ /home/Repo/.Trash/
}

