for cont in `gawk '{print $1}' cont.list`
do
	cd $cont
	for wf in `ls *SAC`
	do
       echo $wf | gawk '{print"r "$1"\ntransfer from polezero subtype plo1 to none freq 0.001 0.002 10 20\nw append .bp\nquit"}' | sac
  done
  cd ..
done
       
