#! /bin/bash

HASH=$1

if [ -z "$HASH" ]; then
  echo "Need hash"
  exit 1
fi
rsync -vaP sw-ipfs.js home:~/projects-jpimac/webpackage/signed-exchange-test/html-signed.jimpick.com/sw.js
ssh home "echo $HASH > ~/projects-jpimac/webpackage/signed-exchange-test/html-signed.jimpick.com/ipfs-hash.txt"

