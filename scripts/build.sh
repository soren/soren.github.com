#!/bin/sh

set -e

# Install git if ruqnning on Alpine Linux
[ -f /etc/alpine-release ] && echo "Installing Tooling" && apk add --quiet git

emacs -Q --script build.el
