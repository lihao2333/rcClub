sttc_suffix()
{
ls $1|sed "s/.*\.\(.*\)/\1/"|sort|uniq -c
}
