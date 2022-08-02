#!/bin/sh
set -eu

"$(dirname $0)/build.sh"
podman run -it --rm --entrypoint sh "dotfiles-test"
"$(dirname $0)/cleanup.sh"
