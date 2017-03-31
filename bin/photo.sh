#! /bin/bash

EXE=$HOME/.scripts/binary/Image-ExifTool/exiftool
CHRIS_INPUT=$HOME/files/photos/chris-camera
CARRIE_INPUT=$HOME/files/photos/carrie-camera

OUTPUT_DIR=$HOME/files/photos/combined

$EXE -r -d $OUTPUT_DIR/%Y/%m/%Y-%m-%d_%H%M%S%%-c.%%e  "-filename<CreateDate" "-filename<DateTimeOriginal" $CHRIS_INPUT
$EXE -r -d $OUTPUT_DIR/%Y/%m/%Y-%m-%d_%H%M%S%%-c.%%e  "-filename<CreateDate" "-filename<DateTimeOriginal" $CARRIE_INPUT

