#!/usr/bin/env bash
# Test LiteLLM -> llama.cpp integration via the OpenAI-compatible chat completions endpoint.

LITELLM_URL="http://localhost:4000"
LITELLM_KEY="sk-1234"

curl -v -s -X POST "${LITELLM_URL}/v1/chat/completions" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${LITELLM_KEY}" \
  -d '{
      "model": "gemma-4-E2B-it-UD-Q8_K_XL.gguf",
      "messages": [
          {
              "role": "user",
              "content": "Say hello in one sentence."
          }
      ]
  }'
