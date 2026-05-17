#!/usr/bin/env bash

docker run --rm -it --gpus all --entrypoint sh ghcr.io/alexsjones/llmfit -c "llmfit $*"
