#!/usr/bin/env bash

docker kill wireshark-broadway
docker rm wireshark-broadway

# If needed, we can change Debian base version
#DEBIAN_VERSION=testing

echo <<EOF
# stable-slim is better than stable, as it produces image 290MB vs 382MB
DEBIAN_VERSION=stable-slim
DEB_VER=$(docker run --rm -it debian:$DEBIAN_VERSION cat /etc/debian_version | sed 's/\r$//')

echo "Building for Debian $DEBIAN_VERSION $DEB_VER"

# Actually passing build-arg variable debian_version may not be necessary of equal to default (stable)
docker build --build-arg debian_version=$DEBIAN_VERSION -t wireshark-broadway:debian-$DEB_VER .
to run, do : 

docker run -d --rm -it -p 8085:8085 --name wireshark-broadway wireshark-broadway:debian-$DEB_VER

Then open http://localhost:8085 in the browser
EOF


