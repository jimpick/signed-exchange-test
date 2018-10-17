#! /bin/bash

/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --user-data-dir=/tmp/udd --ignore-certificate-errors-spki-list=`openssl x509 -noout -pubkey -in cert.pem | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | base64` --enable-features=SignedHTTPExchange https://signed-cdn.jimpick.com/signed.jimpick.com.hello.sxg
