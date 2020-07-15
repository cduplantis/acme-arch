#!/bin/bash
set -e

if [ -x "$(command -v  $1)" ]; then
    exec "$@"
else
    exec plantumld "$@"
fi