#!/bin/bash
set -e

export RUNNER_ALLOW_RUNASROOT=1
export PATH=$PATH:/actions-runner

_RUNNER_NAME=${RUNNER_NAME:-${RUNNER_NAME_PREFIX:-github-runner}-$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '')}
_RUNNER_WORKDIR=${RUNNER_WORKDIR:-/_work}
_LABELS=${LABELS:-default}
_SHORT_URL=${REPO_URL}

echo "Configuring"
./config.sh \
    --url "${_SHORT_URL}" \
    --token "${RUNNER_TOKEN}" \
    --name "${_RUNNER_NAME}" \
    --work "${_RUNNER_WORKDIR}" \
    --labels "${_LABELS}" \
    --unattended \
    --ephemeral \
    --replace

./run.sh