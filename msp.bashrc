alias msp_gdb="msp430-gdb"
msp_gen()
{
mkdir $1
cd $1
cp /home/Proj/ElectroPK/DevelpTools/useful/template/*  . -R
cp /home/Proj/ElectroPK/DevelpTools/useful/template/.  . -R
}
msp_cpl()
{
msp430-gcc -Os -mmcu=msp430g2553 $@ -o ${1%.*}.elf  -g
}

msp_down()
{
mspdebug rf2500 <<EOL
prog $1
exit
EOL

}
