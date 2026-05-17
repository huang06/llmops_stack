# LLM Stack

A self-hosted LLM serving stack composed of three independent services connected via a shared Docker network.

| Service | Role | Port |
|---|---|---|
| **llama.cpp** | Local model inference server (CUDA) | — |
| **LiteLLM** | LLM proxy + model router | 4000 |
| **Langfuse** | LLM observability & tracing UI | 3000 |
| **llmfit** | LLM model right-sizing tool | — |

## Architecture

![LLM Stack Architecture](docs/architecture.svg)

## Services

- **llama.cpp** — LLM inference engine in C/C++ with minimal dependencies and state-of-the-art performance across a wide range of hardware.
- **LiteLLM** — Python SDK and proxy server (AI Gateway) to call 100+ LLM APIs, with load balancing, cost tracking, and logging. Config: `litellm/config.yaml`. API at `http://localhost:4000`.
- **Langfuse** — Open-source LLM engineering platform for observability, prompt management, evaluations, and debugging of LLM applications. UI at `http://localhost:3000`.
- **llmfit** — LLM model right-sizing tool that detects your hardware (RAM, CPU, GPU/VRAM) and recommends which models will run effectively on it. Scores hundreds of HuggingFace models across quality, speed, fit, and context dimensions, and dynamically finds the best quantization level for your hardware. Supports interactive TUI, CLI subcommands (`fit`, `recommend`, `plan`, `search`), a web dashboard on port 8787, and a REST API for cluster scheduling. Run via `llmfit/llmfit.sh`.

## Startup

```bash
docker network create llm_network   # once only

docker compose -f llama.cpp/compose.yaml up -d
docker compose -f litellm/compose.yaml up -d
docker compose -f langfuse/compose.yaml up -d
```

## Teardown

```bash
docker compose -f langfuse/compose.yaml down
docker compose -f litellm/compose.yaml down
docker compose -f llama.cpp/compose.yaml down

docker network rm llm_network
```
