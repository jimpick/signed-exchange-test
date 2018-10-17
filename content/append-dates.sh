#! /bin/bash

while true; do date >> date.txt; ./publish-ipfs.sh; sleep 1; done
