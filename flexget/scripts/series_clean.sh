#! /bin/bash

find "/media/media-drive/TV Shows/The Colbert Report"/Season* -type f -mtime +7 -exec rm {} +
find "/media/media-drive/TV Shows/The Daily Show with Jon Stewart"/Season* -type f -mtime +7 -exec rm {} +

find "/media/media-drive/TV Shows" -type d -empty -exec rm -r {} +
