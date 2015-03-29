#!/usr/bin/env python
# Used to convert a directory directory to a certain size
#requires "convert" to be installed
#script slightly modified from post on https://ma08.github.io/XKCD-Lock-using-i3lock-and-xautolock/

import os
from subprocess import Popen, PIPE, call
import argparse 
import locale

encoding = locale.getdefaultlocale()[1]

#get arguements
parser = argparse.ArgumentParser(description="Can convert a given directory of images to the given dimensions")
parser.add_argument("directory", type=str, help="directory with stored pictures")
parser.add_argument("-x", "--xresolution", help="x size of picture to convert", type=int)
parser.add_argument("-y", "--yresolution", help="y size of picture to convert", type=int)

args = parser.parse_args()
for z in ["jpg","png"]:
    p = Popen("ls ~/ownCloud/Pictures/Wallpapers/*.{}".format(z), stdout=PIPE, shell=True)
    #p = Popen("ls {}".format(args.directory), stdout=PIPE, shell=True)
    result=(p.communicate()[0]).decode(encoding).split('\n')

    for x in result:
        dir_name=os.path.dirname(x)
        base=os.path.basename(x)
        name=os.path.splitext(base)[0]
        call(["convert", x, "-resize","{}x{}!".format(args.xresolution, args.yresolution), x])

