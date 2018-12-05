#! /bin/bash

FILE=$1

if [ -z "$FILE" ]; then
  echo "Need file"
  exit 1
fi

mkdir -p signed

gen-signedexchange \
  -uri https://ipfs.v6z.me/$1 \
  -content $1 \
  -certificate ../cert.pem \
  -privateKey ../priv.key \
  -certUrl https://cbor.jimpick.com/ipfs.v6z.me/cert.cbor \
  -validityUrl https://ipfs.v6z.me/resource.validity.msg \
  -o signed/$1.sxg

