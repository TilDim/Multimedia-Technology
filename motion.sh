#!/bin/bash
path="/home/tildim/Desktop"
inDir=$path"/demos"
outDir=$path"/created_videos/motion"
mkdir -p $outDir
CODEC_ARRAY=( 'libx264' )
BITRATE_ARRAY=( '768k' '1024k' '1280k' '1536k' )
GOPSIZE_ARRAY=( '4' '16' '64' '128' '256' )
CODEC_ELEMENTS=${#CODEC_ARRAY[@]}
BITRATE_ELEMENTS=${#BITRATE_ARRAY[@]}
GOPSIZE_ELEMENTS=${#GOPSIZE_ARRAY[@]}
for (( i=0;i<$CODEC_ELEMENTS;i++)); do
	c_value=${CODEC_ARRAY[${i}]}
	
	for (( j=0;j<$BITRATE_ELEMENTS;j++)); do
		b_value=${BITRATE_ARRAY[${j}]}
		
		for (( k=0;k<$GOPSIZE_ELEMENTS;k++)); do
			g_value=${GOPSIZE_ARRAY[${k}]}
			
			ffmpeg -i $inDir/motion.avi -c:v $c_value -b:v $b_value -g $g_value $outDir/"motion - c: "$c_value", b: "$b_value", g: "$g_value".avi"
		done
	done
done
