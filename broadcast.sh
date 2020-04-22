#!/bin/bash

export FFMPEG_CMD=ffmpeg
export VIDEO_FILE="Loopz_Lesson-3.mp4"
export YOUR_RTMP_URL="rtmp://127.0.0.1:1935/myhlsdemo"

$FFMPEG_CMD -re -i $VIDEO_FILE -acodec copy -vcodec copy -f flv $YOUR_RTMP_URL
