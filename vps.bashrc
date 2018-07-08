#!/bin/bash
vps()
{
if [  $# == 0 ];
then
  awk -v FS=, '{printf "%d %-12s %-12s %-15s %-24s \n",NR-1, $1,$2,$3,$4}' $RC_ROOT/vps.txt
  echo "usage: vps index"
else
  idx=$1
  user=`awk -v FS=, -v idx=$idx '{if(NR==idx+1){print $1}}'  $RC_ROOT/vps.txt`
  ip=`awk -v FS=, -v idx=$idx '{if(NR==idx+1){print $3}}'  $RC_ROOT/vps.txt`
  port=`awk -v FS=, -v idx=$idx '{if(NR==idx+1){print $4}}'  $RC_ROOT/vps.txt`
  passwd=`awk -v FS=, -v idx=$idx '{if(NR==idx+1){print $5}}'  $RC_ROOT/vps.txt`
  echo $user
  echo $ip
  echo $port
  passwd=$passwd"\r"
  echo $passwd
  expect -c "
set timeout 50
spawn ssh  -l  $user $ip -p $port
expect "password:"
send $passwd
interact
"
fi

}
