#!/usr/bin/env sh

script_dir=$(cd "$(dirname "$0")" && pwd -P)

cd "$script_dir" || exit 1

emacs -Q --script build.el

ls -l
