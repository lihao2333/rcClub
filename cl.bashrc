#export QUARTUS_ROOTDIR=/root/intelFPGA/18.1/quartus
# 
#export INTELFPGAOCLSDKROOT=/root/intelFPGA/17.1/hld
# 
#export AOCL_BOARD_PACKAGE_ROOT=/root/intelFPGA/17.1/hld/board/c5p
#
#export PATH=$PATH:$INTELFPGAOCLSDKROOT/linux64/bin:$INTELFPGAOCLSDKROOT/bin:$INTELFPGAOCLSDKROOT/host/linux64/bin:$QUARTUS_ROOTDIR/bin
#
#export LD_LIBRARY_PATH=$AOCL_BOARD_PACKAGE_ROOT/tests/extlibs/lib:$INTELFPGAOCLSDKROOT/host/linux64/lib:$AOCL_BOARD_PACKAGE_ROOT/linux64/lib 
#export QUARTUS_64BIT=1
# 
##export LM_LICENSE_FILE=/root/intelFPGA/17.1/hld/license.dat##这里应该指的是新的license.dat
#export LM_LICENSE_FILE=/root/intelFPGA/17.1/hld/001C42D0C538_1523518581993.dat

export QUARTUS_ROOTDIR=/root/intelFPGA/17.1/quartus

export INTELFPGAOCLSDKROOT=/root/intelFPGA/17.1/hld

export AOCL_BOARD_PACKAGE_ROOT=/root/intelFPGA/17.1/hld/board/c5p

export PATH=$PATH:$INTELFPGAOCLSDKROOT/linux64/bin:$INTELFPGAOCLSDKROOT/bin:$INTELFPGAOCLSDKROOT/host/linux64/bin:$QUARTUS_ROOTDIR/bin

export LD_LIBRARY_PATH=$AOCL_BOARD_PACKAGE_ROOT/tests/extlibs/lib:$INTELFPGAOCLSDKROOT/host/linux64/lib:$AOCL_BOARD_PACKAGE_ROOT/linux64/lib

export QUARTUS_64BIT=1

export LM_LICENSE_FILE=/root/intelFPGA/17.1/hld/license.dat


#export QSYS_ROOTDIR="/root/intelFPGA/17.1/quartus/sopc_builder/bin"

alias clgo_c5pdriver="cd $AOCL_BOARD_PACKAGE_ROOT/linux64/libexec"
alias clgo_c5p="cd $AOCL_BOARD_PACKAGE_ROOT" 
alias clgo_helloworld=" cd $AOCL_BOARD_PACKAGE_ROOT/tests/hello_world"
alias clgo_pyopencl_source="cd /usr/local/lib/python2.7/dist-packages/pyopencl-2018.1.1-py2.7-linux-x86_64.egg/pyopencl"
alias clgo_vectoradd=" cd $AOCL_BOARD_PACKAGE_ROOT/tests/vector_add"
alias ss_bashrc="source ~/.bashrc"
#alias clsource="source /root/intelFPGA/17.1/hld/init_opencl.sh"
#alias clrun_emulate="CL_CONTEXT_EMULATOR_DEVICE_ALTERA=1 ./host "
#alias clcpl_emulator="aoc -march=emulator"
alias clcpl_corss="aoc -report --board c5p"
alias clshow_board="aoc -list-boards"
alias clshow_pci="lspci|grep Altera"
alias clshow_flags="aocl link-config"
alias clshow_all="echo usb;clshow_usb;echo pci;clshow_pci;echo board;clshow_board"
alias clshow_usb="lsusb|grep Altera"
alias cl_install='aocl install'
alias cl_diagnose='aocl diagnose'
cldkr_run()
{
docker run -it --rm -p 8000:8000 \
	-v /root/Proj/neural_web:/workspace/neural_web \
	-v /root/Proj/fast-neural-style-tensorflow:/workspace/fast-neural-style-tensorflow \
	-v /root/Proj/neural-style_diy:/workspace/neural-style_diy\
	-v /Model:/Model\
	--privileged -v /dev:/dev\
	--name intel\
	--net=host\
	-w /workspace/neural_web \
	--entrypoint /bin/bash \
	lihao2333/intel:v4 \
	-c "ls;ls ..;python3 manage.py runserver 0.0.0.0:8000"
}
cldkr_access()
{
docker run -it -p 8000:8000 \
	-v /home/Proj/Intel/neutrul-style/neural_web:/workspace/neural_web \
	-v /home/Proj/Intel/neutrul-style/fast-neural-style-tensorflow:/workspace/fast-neural-style-tensorflow \
	-v /home/Proj/Intel/neutrul-style/neural-style_diy:/workspace/neural-style_diy\
	-v /home/Repo/Model/:/workspace/Model\
	-v /home/Repo/Dataset/:/workspace/Dataset\
	--privileged -v /dev:/dev\
	--name intel_access\
	--net=host\
	-w /workspace/neural_web \
	--entrypoint /bin/bash \
	lihao2333/intel:v3 
}
cldkr_start()
{
	docker start -ai intel_access
}
cldkr_access_simple()
{
docker run -it --rm -p 8000:8000 \
	-v `pwd`:/workspace/proj\
	-v /home/Repo/Model/:/workspace/Model\
	-v /home/Repo/Dataset/:/workspace/Dataset\
	--privileged -v /dev:/dev\
	--name intel_access_simple\
	--net=host\
	-w /workspace/proj \
	--entrypoint /bin/bash \
	lihao2333/intel:v3 
}

cl_help(){
  printf "cl_change_mac\t%s\n" "改变mac地址和license匹配"
  printf "clshow_all\t%s\n" "检测硬件连接和board, 先c5p上电， 再up2"
  printf "cl_install\t%s\n" "安装board"
  printf "cl_flash xxx.aocx\t%s\n" "烧录flash，5min左右,之后从c5p要重启,然后up2重启,否则diagnose失败" 
  printf "cl_diagnose\t%s\n" "诊断设备"
  printf "cl_program xxx.aocx\t%s\n" "通过USB把程序给c5p"
  printf "clcpl_kernel device/xxx.cl\t%s\n" "编译内核， 要在指定目录下, 这一步需要很长时间"
  printf "clcpl_emulator device/xxx.cl\t%s\n" "模拟编译，比较省时间， 方便测试"
  printf "clrun_emulator bin/host\t%s\n" "模拟运行"



}
cl_flash()
{
if [[ $# -ne 1 ]]; then
echo please input xxx.aocx
else
aocl flash acl0 $1
fi
}

cl_program()
{
if [[ $# -ne 1 ]]; then
echo please input xxx.aocx
else
aocl program acl0 $1
fi
}
clcpl_kernel()
{
  if [[ $# -ne 1 ]];then
    echo please input device/xxx.cl
  else
    fullname=$(basename $1)
    dir=$(dirname $1)
    filename=$(echo $fullname|cut -d . -f1)
    aoc $dir/$filename.cl -o bin/$filename.aocx -board=c5p -report -v
  fi
}
clcpl_emulator()
{
  if [[ $# -ne 1 ]];then
    echo please input device/xxx.cl
  else
    fullname=$(basename $1)
    dir=$(dirname $1)
    filename=$(echo $fullname|cut -d . -f1)
    aoc  -march=emulator $dir/$filename.cl -o bin/$filename.aocx -board=c5p 
  fi
}
clrun_emulator()
{
  if [[ $# -ne 1 ]];then
    echo please input bin/host
  else
#    CL_CONTEXT_EMULATOR_DEVICE_ALTERA=1 $1
     CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=1 $1
  fi
}

cl_change_board()
 {
      export AOCL_BOARD_PACKAGE_ROOT="$INTELFPGAOCLSDKROOT/board/$1"
              cl_source
                  }
alias cl_change_mac="ifconfig eth0 hw ether 00:1c:42:d0:c5:38"
