#! /bin/bash

HASH=$1

if [ -z "$HASH" ]; then
  echo "Need hash"
  exit 1
fi
#rsync -vaP sw-ipfs.js home:~/projects-jpimac/webpackage/signed-exchange-test/html-ipfs.v6z.me/sw.js
ssh home "echo $HASH > ~/projects-jpimac/webpackage/signed-exchange-test/html-ipfs.v6z.me/ipfs-hash.txt"

