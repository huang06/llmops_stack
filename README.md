# LLM Stack

A self-hosted LLM serving stack composed of three independent services connected via a shared Docker network.

| Service | Role | Port |
|---|---|---|
| **llama.cpp** | Local model inference server (CUDA) | — |
| **LiteLLM** | LLM proxy + model router | 4000 |
| **Langfuse** | LLM observability & tracing UI | 3000 |

## Architecture

![LLM Stack Architecture](docs/architecture.svg)

## Services

- **llama.cpp** — LLM inference engine in C/C++ with minimal dependencies and state-of-the-art performance across a wide range of hardware. Configure the model path in `llama.cpp/compose.yaml` before starting.
- **LiteLLM** — Python SDK and proxy server (AI Gateway) to call 100+ LLM APIs, with load balancing, cost tracking, and logging. Config: `litellm/config.yaml`; API keys: `litellm/.env`. API at `http://localhost:4000`.
- **Langfuse** — Open-source LLM engineering platform for observability, prompt management, evaluations, and debugging of LLM applications. Update credentials in `langfuse/compose.yaml` (search for `# CHANGEME`) before starting. UI at `http://localhost:3000`.

## Startup

```bash
docker network create llm_network   # once only

cd llama.cpp && docker compose up -d && cd ..
cd litellm   && docker compose up -d && cd ..
cd langfuse  && docker compose up -d && cd ..
```

## Teardown

```bash
cd langfuse  && docker compose down && cd ..
cd litellm   && docker compose down && cd ..
cd llama.cpp && docker compose down && cd ..

docker network rm llm_network
```
