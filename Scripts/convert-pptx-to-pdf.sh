#!/bin/zsh

libreoffice --headless --invisible --convert-to pdf *.ppt
libreoffice --headless --invisible --convert-to pdf *.pptx
rm -i *.ppt
rm -i *.pptx
