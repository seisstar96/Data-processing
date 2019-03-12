#!/bin/bash

for cont in `cat cont.list`
do

year=`echo $cont | gawk '{print substr($1,1,4)}'`
month=`echo $cont | gawk '{print substr($1,5,2)}'`
day=`echo $cont | gawk '{print substr($1,7,2)}'`
hour=`echo $cont | gawk '{print substr($1,9,2)}'`
min=`echo $cont | gawk '{print substr($1,11,2)}'`
sec=`echo $cont | gawk '{print substr($1,13,2)}'`
msec="000"

cd $cont
	gsact $year $month $day $hour $min $sec $msec f *.SAC | gawk '{printf "r "$1"\nch o "$2"\nwh\n"} END{print "quit"}' | sac
        saclst o f *.SAC | gawk '{printf "r %s\nch allt %.5f\nwh\n",$1,$2*(-1)} END{print "quit"}' | sac
cd ..

done
