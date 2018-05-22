alias clgo_hld='cd /home/Proj/Intel/Install/hld'
alias clsource=" source /home/Proj/Intel/Install/hld/init_opencl.sh "
alias clsource_cpl="source /home/Proj/Intel/Install/embedded/embedded_command_shell.sh"
alias clrun_emulate="CL_CONTEXT_EMULATOR_DEVICE_ALTERA=1 ./host "
alias clcpl_corss="aoc -report --board c5p"
alias clcpl_emulator="aoc -march=emulator"

clchange_board()
{
	export AOCL_BOARD_PACKAGE_ROOT="$INTELFPGAOCLSDKROOT/board/$1"
	cl_source
}

