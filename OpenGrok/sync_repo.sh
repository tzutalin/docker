#!/bin/sh

###################################################################################
#                                                                                 #
#  Simply download all of github projects                                         #
#                                                                                 #
#  Copyright (c) 2013-Present Darrenl                                             #
###################################################################################


# Functions
sync() {
  local url="$1"
  local branch="$2"
  local dirName="$3"
  local currDir=$(pwd)
  # If the repo exists before, just sync it
  if [ "$(ls -A $dirName)" ]; then
    echo "$dirName repo exists, try to update it"
    cd "$dirName"
    git pull --recurse-submodules
    cd "$currDir"
    return
fi
  echo "Download $dirName from scratch"
  git clone --recursive "$url" -b "$branch" "$dirName"
}

ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIRECTORY="$ABSOLUTE_PATH/localsrc"

# Create DIRECTORY if needed
if [ ! -d "$DIRECTORY" ]; then
  mkdir -p "$DIRECTORY"
fi

# Change to DIRECTORY
cd "$DIRECTORY"

while true; do
  # sync URL BRANCH LOCAL_NAME
  sync "https://github.com/tzutalin/labelImg" "master" "labelImg"
  # 30 ins
  sleep 1800
done
