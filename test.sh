#!/bin/bash
array=(*/)
dir_count=0
for dir in "${array[@]}"; do
    echo "Building $dir_count/${#array[@]}"
    dockerfile_dir="$(echo $dir)Dockerfile"
    dockerfile_md5=$(md5sum ${dir}Dockerfile | cut -d ' ' -f1)
    echo "Checking for existing image for tool: $dir with Dockerfile md5 hash of: $dockerfile_md5"

    ((dir_count=dir_count+1))
done
