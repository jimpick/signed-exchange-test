#! /bin/bash

set -e

cd /Users/jim/projects-jpimac/webpackage/signed-exchange-test

HASH=$(ipfs add -Q -r html-ipfs.v6z.me)
echo New base site hash $HASH

set -x

ipfs name publish --key=ipfs.v6z.me-html $HASH

