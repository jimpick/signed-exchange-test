#! /bin/bash

set -e

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
(cd ..; ./publish-sw-ipfs.sh $HASH)

set -x

ipfs swarm connect /ip4/64.46.22.7/tcp/4002/ws/ipfs/QmScdku7gc3VvfZZvT8kHU77bt6bnH3PnGXkyFRZ17g9EG
ssh home ipfs pin add $HASH
ssh home /Users/jim/projects-jpimac/webpackage/signed-exchange-test/republish-html-ipfs.v6z.me.sh
echo Checking if published hash matches $HASH
curl https://ipfs.v6z.me/ipfs-hash.txt

