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
set -x
ipfs name publish --key=signed-jimpick-com $HASH
URL2=https://ipfs.jimpick.com/ipns/QmXX8CERLYAzetnmATjxh7pQUZAaVbAWtb9vsCqmn5b7Fi
echo $URL2
