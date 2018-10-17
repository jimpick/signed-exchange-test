#! /bin/bash

FILE=$1

if [ -z "$FILE" ]; then
  echo "Need file"
  exit 1
fi

mkdir -p signed

gen-signedexchange \
  -uri https://signed.jimpick.com/$1 \
  -content $1 \
  -certificate ../cert.pem \
  -privateKey ../priv.key \
  -certUrl https://signed-cdn.jimpick.com/cert.cbor \
  -validityUrl https://signed.jimpick.com/resource.validity.msg \
  -o signed/$1.sxg
