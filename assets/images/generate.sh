#!/usr/bin/env bash
PWD="$PWD/$(dirname ${BASH_SOURCE[0]})"

mkdir -p "$PWD/"{2x,4x}

cd "$PWD/source"
for image in $(find . -type f); do
    filedir="$(dirname -- "$image")"
    filename="$(basename -- "$image")"
    extension="${filename##*.}"
    filename="${filename%.*}"
    base="$(dirname "$PWD")"

    old="$PWD/$filedir/$filename.$extension"
    single="$base/$filedir/$filename.png"
    double="$base/$filedir/2x/$filename.png"
    cubed="$base/$filedir/4x/$filename.png"

    mkdir -p "$base/$filedir/"{,2x,4x}

    echo convert -background none "$old" "$single"
    convert -background none "$old" "$single"

    # Get size of 1x image
    WIDTH=$(convert "$single" -format "%[w]" info:)
    HEIGHT=$(convert "$single" -format "%[h]" info:)
    
    echo convert -size "$(( $WIDTH * 2 ))x$(( $HEIGHT * 2 ))" -background none "$old" "$double"
    convert -size "$(( $WIDTH * 2 ))x$(( $HEIGHT * 2 ))" -background none "$old" "$double"
    echo convert -size "$(( $WIDTH * 4 ))x$(( $HEIGHT * 4 ))" -background none "$old" "$cubed"
    convert -size "$(( $WIDTH * 4 ))x$(( $HEIGHT * 4 ))" -background none "$old" "$cubed"
done
