#!/usr/bin/python

import sys

def main(argv):
    # make sure you have all your args
    #~ if len(argv) < 3:
        #~ usage()
        #~ sys.exit(2)
        
    # process todo.txt
    try:
        f = open (argv[0], "r")
        projects = {}

        for line in f:
            words = line.split()

            for word in words:
                if word[0:2] == "p:" or word[0:2] == "p-" or word[0:1] == "+":
                    if ':' in word:
                        project, sub_project = word.split(':')
                        
                        if project not in projects:
                            projects[project] = []
                            projects[project].append(sub_project)
                        else:
                            if sub_project not in projects[project]:
                                projects[project].append(sub_project)
                                
                    else:
                        if word not in projects:
                            projects[word] = []
                            

        f.close()
    except IOError:
        print "ERROR:  The file named %s could not be read."% (argv[0], )
        usage()
        sys.exit(2)

    for key in projects:
        print(key, projects[key])

if __name__ == "__main__":
    main(sys.argv[1:])
