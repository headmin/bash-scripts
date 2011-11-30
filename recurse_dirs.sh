#!/bin/bash

##description    :scans a directory recursively, display  
##author         :henry stamerjohann 
##date           :2011-07-24
##version        :0.4 


# function to scan dir recursively, 
# variable $1 substituted will be the root directory
recurse() {
 for i in "$1"/*;do
    if [ -d "$i" ];then
        echo "dir: $i"
        recurse "$i"
    elif [ -f "$i" ]; then
        echo "file: $i"
    fi
 done
}

# function to list only filenames, strip path with sed
file_remove_paths() {
grep file | sed 's/.*\///'
}

# function to list only the directories, strip path with sed
dir_remove_paths() {
grep dir | sed 's/.*\///'
}

## function call, substitute path | pipe function to strip path component > display font names
echo "files in /Library/Fonts/ "
echo ""
recurse /Library/Fonts/ | file_remove_paths
echo ""

## function call, substitute path | pipe function to strip path component > display dir names
echo "dirs in /Library/Fonts/"
echo ""
recurse /Library/Fonts/ | dir_remove_paths 
echo ""

exit 0