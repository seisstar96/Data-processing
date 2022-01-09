#!/usr/bin/env python
# -*- coding: utf8 -*-
import os
import sys
import glob
import subprocess

os.putenv("SAC_DISPLAY_COPYRIGHT", "0")

if len(sys.argv) != 2:
    sys.exit("Usage: python {} dirname\n".format(sys.argv[0]))

dirname = sys.argv[1]

os.chdir(dirname)

s = ""
for sacfile in glob.glob("*.SAC"):
    net, sta, loc, chn = sacfile.split('.')[0:4]
  #  pz = glob.glob("/data1/MenyuanDataRaw/resp/RESP.{}.{}.00.{}".format(net, sta, chn))
    pz = glob.glob("RESP.{}.{}.00.{}".format(net, sta, chn))
    print(pz)
    # 暂不考虑多个PZ文件的情况
    if len(pz) != 1:
        sys.exit("PZ file error for {}".format(sacfile))

    s += "r {} \n".format(sacfile)
    s += "rmean; rtr; taper \n"
    s += "transfer from evalresp fname {} to vel freq 0.05 0.1 10.0 15.0\n".format(pz[0])
    #s += "mul 1.0e-9 \n"
    s += "w over \n"
#    s += "w append .bp\n"


s += "q \n"
subprocess.Popen(['sac'], stdin=subprocess.PIPE).communicate(s.encode())

os.chdir("..")
