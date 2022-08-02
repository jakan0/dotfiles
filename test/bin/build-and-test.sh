#!/bin/sh
set -eu

"$(dirname $0)/build.sh"
podman run -it --rm "dotfiles-test" .bats
"$(dirname $0)/cleanup.sh"
