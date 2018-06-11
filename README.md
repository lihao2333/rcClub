## 如何使用
每个分支代表一组user+host, master分支是一些通用型的, 你只用master分支就好了.  
克隆到本地后, 执行 `sh ./update.sh`把路径改为你当前的路径.  
假如你将项目克隆到家目录下, 那么在`~/.bashrc`中添加`source ~/rcClub/main.bashrc`, 然后执行'source ~/.bashrc'.  
试试执行`up`, 是不是相当于'cd ..'的效果?  

## 如何添加自定义命令?
创建`xxx.bashrc`, 执行`sh ./update.sh`, 执行`ss_bashrc`

## 举个栗子？
* 想要向上三级， 你用`cd ../../..`? No, 用`up 3`
* 想要快速跳转到某个目录， 你用 `cd xx/x/x/x/x/xx/`? No， 存储到bashrc后用`go_xx`
* `rm xx`后想撤销？ 执行`ur xx`， 怎么做到的？ 把rm重定义为移动到回收站
* 快速登录网关懒得打开浏览器？ `by_login` 这个是我从别的[github](https://github.com/wzyuliyang/byrlogin)上找的一个程序， 把用户名和密码固化后 重定义了而已
* 天天要刷教务？ `bt_info`就可以 实际上就是用浏览器打开一个网址
* 经常要`source ~/.bashrc`? No, `ss_bashrc` 就好
* 还有把`cd`换成`c`, `ls`换成`l`, `vim`换成`v` `evince`换成`e`等等。 命令行的优势是自己定制 如果因为命令记不住而放弃命令行 真是逐本求末了
* 除此之外还有vim tmux的一些配置， 自己看吧
