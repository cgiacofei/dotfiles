#! /bin/python

"""series_clean.py: Removes old files from the system.

The dictionary s_clean contains the show folders to scan and how long to
keep the files within those folders.
"""

import os
import time
import datetime

tv_root = '/media/media-drive/TV Shows'
s_clean = {'The Colbert Report':7,
           'The Daily Show with Jon Stewart':7}

torrent_root = '/home/media/torrents/completed'
torrent_location = {'tv_shows':30,
                    'tv_premieres':30,
                    'movies':30}

test_dir = '/home/chris/testing'

log_name = 'clean.log'

def delete_old_files(dirpath, max_age, extra=''):
    max_age *= 86400 # convert days to seconds
    present = time.time()
    timestamp = datetime.datetime.fromtimestamp(present).strftime('%Y-%m-%d %H:%M:%S')

    with open(log_name, "a") as myfile:
        myfile.write('Checking files in ' + dirpath + ' and removing older than ' + str(max_age/86400) + ' days\n')

    for root, dirs, files in os.walk(dirpath):
        for old_thing in files:
            file_name = os.path.join(root, old_thing)

            try:
                file_age = present - os.path.getmtime(file_name)
                if file_age > max_age and extra in root:
                    #os.remove(file_name)
                    with open(log_name, "a") as myfile:
                        output = '%s --- Age %03d days | Removing: %s\n' % (timestamp, int(file_age)/86400, file_name)
                        myfile.write(output)
                        myfile.write(' Age: ' + str(int(file_age)/86400) + ' days | Removing: ' + file_name + '\n')
            except:
                pass

for show in s_clean:
    delete_old_files(os.path.join(tv_root,show), s_clean[show], 'Season')

for folder in torrent_location:
    delete_old_files(os.path.join(torrent_root,folder), torrent_location[folder], folder)
