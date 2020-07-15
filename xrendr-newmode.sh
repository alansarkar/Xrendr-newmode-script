#!/bin/sh

ARGS=3
num_args=$#
if [ $num_args -lt $ARGS ]; then
     echo "
##################################################
Enter display hight weight and refresh rate(float)

    Example ./xrandr-newmode.sh 1920 1080 80.00 
################################################# 
"
#echo $0

else
x=$1
y=$2
z=$3 
## get default output
out="$(xrandr | head -2 | tail -1 | cut -d' ' -f1)"

#function xrandr_mode() {
cvt "$x" "$y" "$z"  | tail -1 | cut -d' ' -f2-40 > /tmp/xrandr-mode  
xrandr --newmode  "$x"x"$y"_"$z" $(cat /tmp/xrandr-mode | cut -d' ' -f3-20)
  xrandr --addmode "$out" "$x"x"$y"_"$z"
  xrandr --output "$out" --mode "$x"x"$y"_"$z"
#}

#xrandr_mode $x $y $z
fi
#exit $?
exit 0
