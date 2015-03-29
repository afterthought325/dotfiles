#!/usr/bin/env python
#runs i3lock with a random wallpaper
#!/usr/bin/env python


from random import randint
from subprocess import Popen, PIPE,call
import locale

encoding = locale.getdefaultlocale()[1]

p = Popen("ls ~/ownCloud/Pictures/Wallpapers/*.png", stdout=PIPE, shell=True)
result=p.communicate()[0].decode(encoding).split('\n')[0:-1]
n=len(result)
comic=result[randint(0,n)]

#saving the choice for reference
f = open('./wallpaper_i3lock_choices.txt', 'a')
f.write(comic+"\n")
f.close()
call(["i3lock","-i",comic,"-t", "-e"])
