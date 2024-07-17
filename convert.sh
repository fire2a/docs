#!/bin/bash

# 1
# Find all .gif files recursively from the current directory
find . -type f -name "*.gif" | while read -r gif_file; do
  # Extract the base name without the extension
  base_name="${gif_file%.*}"
  
  # Define the new filename with .mp4 extension
  mp4_file="${base_name}.mp4"

  # Use ffmpeg to convert the gif to mp4
  echo "Converting $gif_file to $mp4_file"
  # ffmpeg -i "$gif_file" "$mp4_file"
  ffmpeg -i $gif_file -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" $mp4_file
  
  echo "Converted $gif_file to $mp4_file"
done

# 2
# manual
gif_file=qgis_windows_activate_venv.gif
base_name="${gif_file%.*}"
mp4_file="${base_name}.mp4"
rm $mp4_file
ffmpeg -i $gif_file -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" $mp4_file

# 3
# check
find . -type f -name "*.gif" | while read -r gif_file; do
  # Extract the base name without the extension
  base_name="${gif_file%.*}"
  # Define the new filename with .mp4 extension
  mp4_file="${base_name}.mp4"
  ls -lh $gif_file $mp4_file
  echo "Converted $gif_file to $mp4_file"
done
