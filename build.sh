#!/usr/bin/env bash

set -euo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

emacs -Q --script "${script_dir}/build.el"

ls -l "$script_dir"
