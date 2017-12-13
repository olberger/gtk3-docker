#!/usr/bin/env bash

docker kill wireshark-broadway
docker rm wireshark-broadway

docker build -t wireshark-broadway .

echo <<EOF
to run, do : 

docker run -d --rm -it -p 8085:8085 --name wireshark-broadway wireshark-broadway

Then open http://localhost:8085 in the browser
EOF


