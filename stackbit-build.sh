#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5fcda26d4a0d0e00162b4d69/webhook/build/pull > /dev/null
curl -s -X POST https://api.stackbit.com/project/5fcda26d4a0d0e00162b4d69/webhook/build/ssgbuild > /dev/null
hugo
./inject-netlify-identity-widget.js public
curl -s -X POST https://api.stackbit.com/project/5fcda26d4a0d0e00162b4d69/webhook/build/publish > /dev/null
