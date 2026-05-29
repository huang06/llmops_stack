#!/usr/bin/env bash

curl http://127.0.0.1:8080/v1/embeddings \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer dummy-key" \
 -d '{
  "input": ["ping", "ping"],
  "model": "bge-m3-q8_0.gguf"
}' | jq
