#!/usr/bin/env bash
PWD="$PWD/$(dirname ${BASH_SOURCE[0]})"

mkdir "$PWD/"{2x,4x}

cd "$PWD/svgs";
for image in $(find . -name '*.svg'); do
    NAME=${image%".svg"}
    convert "$PWD/$image" -background none "$PWD/../$NAME.png"

    # Get size of 1x image
    WIDTH=$(convert "$PWD/../$NAME.png" -format "%[w]" info:)
    HEIGHT=$(convert "$PWD/../$NAME.png" -format "%[h]" info:)
    
    convert -size "$(( $WIDTH * 2 ))x$(( $HEIGHT * 2 ))" -background none "$PWD/$image" "$PWD/../2x/$NAME.png"
    convert -size "$(( $WIDTH * 4 ))x$(( $HEIGHT * 4 ))" -background none "$PWD/$image" "$PWD/../4x/$NAME.png"
done
