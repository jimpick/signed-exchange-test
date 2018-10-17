#! /bin/bash

rm -rf signed
for f in `find . -maxdepth 1 -type f | grep -v \.sh$ | sed 's,^\./,,'`; do
  #echo $f
  ./make-sxg.sh $f
done
#ipfs add -r signed
HASH=$(ipfs add -Q -r signed)
URL=https://ipfs.jimpick.com/ipfs/$HASH
echo $URL
echo $URL | pbcopy
(cd ..; ./publish-sw-ipfs.sh $HASH)

set -x

ssh home ipfs pin add $HASH
