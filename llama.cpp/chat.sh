#!/usr/bin/env bash

curl http://127.0.0.1:8080/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer dummy-key" \
  -d '{
    "model": "gemma-4-E4B-it-UD-Q8_K_XL.gguf",
    "messages": [
      {
        "role": "system",
        "content": "You are a helpful, concise assistant."
      },
      {
        "role": "user",
        "content": "Explain chat completions in one sentence."
      }
    ]
  }' | jq
