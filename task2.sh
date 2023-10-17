#!/usr/bin/bash

# Backup
#   Archive as a “tarball” (*.tar.gz file) all the files in your home directory tree (/home/your-name) that have been modified in the last 24 hours. Hint: use find.

echo -e "Enter . for Current Directory"
echo -e "Enter path to file 'folder/newfoler' to avoid imbiguity\n"

read pathforfile

# pathforfile=$1

modfiles=$(find $pathforfile -mmin -1440)

tar -cvf hours24mod.tar $modfiles