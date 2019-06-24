#!/bin/bash

# input a 270 orientation theme

#fetching the snapshot position and dimension from theme.conf
#sed -n "/snapshot/,/alpha/p" $1/theme.conf > tmp
#snap_x1=$(grep position tmp | cut -d"{" -f2| cut -d"," -f1 | xargs)
#snap_y1=$(grep position tmp | cut -d"{" -f2| cut -d" " -f3 | xargs)
#snap_x2=$(grep dimension tmp | cut -d"{" -f2| cut -d"," -f1 | xargs)
#snap_y2=$(grep dimension tmp | cut -d"{" -f2| cut -d" " -f3 | xargs)


#fetching screen width and video position from lemonlauncher.conf
height=$(grep "^height" $1/lemonlauncher.conf| sed "s/ //g" | cut -d"=" -f2)
video_orientation=$(grep "^video_orientation" $1/lemonlauncher.conf| sed "s/ //g" | cut -d"=" -f2)
video_x1=$(grep "^video_x1" $1/lemonlauncher.conf| sed "s/ //g" | cut -d"=" -f2)
video_x2=$(grep "^video_x2" $1/lemonlauncher.conf| sed "s/ //g" | cut -d"=" -f2)
video_y1=$(grep "^video_y1" $1/lemonlauncher.conf| sed "s/ //g" | cut -d"=" -f2)
video_y2=$(grep "^video_y2" $1/lemonlauncher.conf| sed "s/ //g" | cut -d"=" -f2)


echo $height
echo $video_orientation
echo $video_x1
echo $video_x2
echo $video_y1
echo $video_y2

#if [ "$video_orientation" == "0" ] ; then
#    echo "correct base orientation found"

    sed -i "/^video_*/d" $1/lemonlauncher.conf
    sed -i "/^rotate*/d" $1/lemonlauncher.conf


    video_y1_180=$(( $height - $video_y2))
    video_y2_180=$(( $height - $video_y1))

    echo "rotate = \"flip\"" >> $1/lemonlauncher.conf

    echo "video_x1 = $video_x1" >> $1/lemonlauncher.conf
    echo "video_y1 = $video_y1_180" >> $1/lemonlauncher.conf
    echo "video_x2 = $video_x2" >> $1/lemonlauncher.conf
    echo "video_y2 = $video_y2_180" >> $1/lemonlauncher.conf

    echo "video_orientation = 180" >> $1/lemonlauncher.conf
    echo "video = \"/mnt/sda/rpi2jamma/videos/%r.mp4\"" >> $1/lemonlauncher.conf

    
#fi 


