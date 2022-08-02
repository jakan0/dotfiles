#!/bin/sh
set -eu

basedir=$(cd `dirname $0` ; cd ../.. ; pwd)
podman build -t "dotfiles-base:latest" -f "test/containers/Containerfile.base" "${basedir}"
podman build -t "dotfiles-test:latest" -f "test/containers/Containerfile.test" "${basedir}"
