#! /bin/bash

set -x

curl https://ipfs.jimpick.com/ipns/ipfs.v6z.me/ipfs-hash.txt
curl https://ipfs.io/ipns/ipfs.v6z.me/ipfs-hash.txt
curl https://cloudflare-ipfs.com/ipns/ipfs.v6z.me/ipfs-hash.txt
curl https://ipfs.v6z.me/ipfs-hash.txt

# ssh home ipfs name resolve -r /ipns/ipfs.v6z.me/

# ipfs swarm connect /ip4/64.46.22.7/tcp/4002/ws/ipfs/QmScdku7gc3VvfZZvT8kHU77bt6bnH3PnGXkyFRZ17g9EG
# ipfs name resolve -r /ipns/ipfs.v6z.me/
