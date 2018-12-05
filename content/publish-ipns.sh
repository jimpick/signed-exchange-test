#! /bin/bash

rm -rf signed
for f in `find . -maxdepth 1 -type f | grep -v \.sh$ | sed 's,^\./,,'`; do
  #echo $f
  ./make-sxg.sh $f
done
#ipfs add -r signed
HASH=$(ipfs add -Q -r signed)
URL=https://ipfs.io/ipfs/$HASH
echo $URL
echo $URL | pbcopy
set -x
ipfs name publish --key=ipfs-v6z-me $HASH
URL2=https://ipfs.io/ipns/QmZWWM9nz5HTqdVuURN1YGskfc3vv24BSoQnwc3QYcmy82

set -x

ssh home ipfs pin add $HASH
echo $URL2
