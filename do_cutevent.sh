#echo 2017* | xargs -n 1 cp -v pickps.py pre.py 
CURDIR=`pwd`
for date_dir in `ls -d 2017*`
 # mkdir Jzevent
        do
                cd ${date_dir}
                   for fl in $(ls *SUM*)
                      do
                        for event in $(cat prep.*.dat | awk '{print NR}')
                         do
                            sta=`echo $fl | awk -F . '{print $1}'`
                            com=`echo $fl | awk -F . '{print $5}'`
                            eventname=`cat prep.*.dat | awk 'NR=="'"$event"'"{print $1}'`
                            mkdir JZ.$eventname
                            time=`cat prep.*.dat | awk 'NR=="'"$event"'"{print $1}'`        ##P-wave time
                            time1=`cat prep.*.dat | awk 'NR=="'"$event"'"{print $1-15}'`     ##P-wave forward
                            time2=`cat prep.*.dat | awk 'NR=="'"$event"'"{print $1+35}'`    ##P-wave backward
                            printf "cut $time1 $time2 \nr $fl\nch LOVROK true\nw ./JZ.$eventname/$time.JZ.$sta.$com\nq\n" | sac
                          done
                      done
                cd $CURDIR
         done
