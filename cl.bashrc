export QUARTUS_ROOTDIR=/root/intelFPGA/17.1/quartus
 
export INTELFPGAOCLSDKROOT=/root/intelFPGA/17.1/hld
 
export AOCL_BOARD_PACKAGE_ROOT=/root/intelFPGA/17.1/hld/board/c5p

export PATH=$PATH:$INTELFPGAOCLSDKROOT/linux64/bin:$INTELFPGAOCLSDKROOT/bin:$INTELFPGAOCLSDKROOT/host/linux64/bin:$QUARTUS_ROOTDIR/bin

export LD_LIBRARY_PATH=$AOCL_BOARD_PACKAGE_ROOT/tests/extlibs/lib:$INTELFPGAOCLSDKROOT/host/linux64/lib:$AOCL_BOARD_PACKAGE_ROOT/linux64/lib 
export QUARTUS_64BIT=1
 
export LM_LICENSE_FILE=/root/intelFPGA/17.1/hld/license.dat



export QSYS_ROOTDIR="/root/intelFPGA/17.1/quartus/sopc_builder/bin"

alias go_c5pdriver="cd /root/intelFPGA/17.1/hld/board/c5p/linux64/libexec"
alias ss_bashrc="source ~/.bashrc"
alias clsource="source /root/intelFPGA/17.1/hld/init_opencl.sh"
alias clrun_emulate="CL_CONTEXT_EMULATOR_DEVICE_ALTERA=1 ./host "
alias clcpl_emulator="aoc -march=emulator"
alias clcpl_corss="aoc -report --board c5p"
cl_change_board()
 {
      export AOCL_BOARD_PACKAGE_ROOT="$INTELFPGAOCLSDKROOT/board/$1"
              cl_source
                  }

