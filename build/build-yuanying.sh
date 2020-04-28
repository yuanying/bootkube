#!/usr/bin/env bash
set -euo pipefail

VERSION=${VERSION:-"v0.18.0"}

BOOTKUBE_ROOT=$(git rev-parse --show-toplevel)
cd ${BOOTKUBE_ROOT}

docker buildx build -t yuanying/pod-checkpointer:${VERSION} --platform=linux/arm64,linux/amd64 . --push
cd -
