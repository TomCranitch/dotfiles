#!/bin/sh

set_wallpaper() {
  feh --no-fehbg --bg-fill "$file" && exit 0
}
color() {
  echo -n "#"; echo "$colors" | cut -f$1 -d , | tr -d "[:space:]"
}
circle() {
  echo "$pos" | xargs -n3 | sed -n "$1"p | awk '{print "translate "$1", "$2"circle 0,0 "$3",0"}'
}

#file="$HOME/.cache/wallpaper-$(cat ~/.theme).png"
file="$HOME/.cache/wallpaper.png"

colors="$(tcolors -output-on-exit -o hex)"

width="1920"
height="1080"

#if [ -r "$HOME/.cache/wallpaper-$(cat ~/.theme).png" ]; then
#  set_wallpaper
#fi

pos=$(bc <<EOF
  scale=4;
            -40;            -40; $width * 0.50; # top left
  $width * 0.75; $height * 0.30; $width * 0.30; # top right
  $width * 0.10; $height * 0.70; $width * 0.22; # bottom left
  $width * 0.50; $height * 0.90; $width * 0.15; # bottom middle
  $width * 0.80; $height * 0.70; $width * 0.20; # bottom right
EOF
)

echo "$(color 1) $(color 2)"


convert \
  -size "${width}x${height}" xc:black \
    -stroke white -strokewidth 1 \
    -fill "$(color 1)" -draw "$(circle 1)" \
    -fill "$(color 3)" -draw "$(circle 2)" \
    -fill "$(color 6)" -draw "$(circle 3)" \
    -fill "$(color 4)" -draw "$(circle 4)" \
    -fill "$(color 2)" -draw "$(circle 5)" \
    -resize 10% \
    -blur 50x200 \
    -bordercolor "$(color 7)" -border 2x2 \
    -filter Gaussian -define filter:blur=2 -define filter:sigma=2 -resize 1000% \
  "$file" 

wal -i $file -a 75
betterlockscreen -u $file

echo "Done!"
