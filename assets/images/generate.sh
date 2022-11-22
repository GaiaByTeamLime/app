#!/usr/bin/env bash
PWD="$PWD/$(dirname ${BASH_SOURCE[0]})"

mkdir "$PWD/"{2x,4x}

cd "$PWD/source";
for image in $(find . -type f); do
    filename=$(basename -- "$image")
    extension="${filename##*.}"
    filename="${filename%.*}"
    convert "$PWD/$image" -background none "$PWD/../$filename.png"

    # Get size of 1x image
    WIDTH=$(convert "$PWD/../$filename.png" -format "%[w]" info:)
    HEIGHT=$(convert "$PWD/../$filename.png" -format "%[h]" info:)
    
    convert -size "$(( $WIDTH * 2 ))x$(( $HEIGHT * 2 ))" -background none "$PWD/$image" "$PWD/../2x/$filename.png"
    convert -size "$(( $WIDTH * 4 ))x$(( $HEIGHT * 4 ))" -background none "$PWD/$image" "$PWD/../4x/$filename.png"
done
