# Agentic AI Academy - Prep package

Welcome! The June academy is a hands-on, in-person week. To get the most out of it, we've prepared this document to make sure we all cover the prerequisites before day 1. None of this is mandatory - pick what you need based on your background.

## Before you arrive

### Setup (required)

- Laptop with internet access and admin rights to install software
- **Docker Desktop** (or Docker Engine on Linux) installed and running
- **GitHub account** (free tier is fine)
- A working **Python 3.11+** install with the ability to manage dependencies (we recommend [uv](https://docs.astral.sh/uv/))
- **Azure CLI** (`az`) installed and signed in
- Comfort with a terminal / CLI

### Prerequisite knowledge

We expect all participants to be comfortable with:

- Basic AI concepts (probabilistic vs. deterministic, training vs. inference)
- Working with LLMs: prompting, context management
- Python and dependency management
- Containers and container images
- REST APIs
- Git / GitHub basics
- Basic SQL against a relational DB (SELECT, WHERE, JOIN, GROUP BY)
- Navigating the Azure console; reasoning about identity, storage, compute, networking

If any of the above feel rusty, see the refresher tracks below.

---

## Python - production patterns, `uv`, packaging

- [Learn Python](https://www.learnpython.org) - Python basics
- [uv - Getting started](https://docs.astral.sh/uv/getting-started/) - the project + dependency manager we use throughout the academy. `uv init`, `uv add`, `uv sync`, lockfiles.
- [Real Python - Modern Python tooling](https://realpython.com/python-virtual-environments-a-primer/) - envs and isolation, in plain language.
- [Real Python - async IO](https://realpython.com/async-io-python/) - `async`/`await` shows up in every LLM SDK call.

## Docker & containers

- [The Docker Handbook](https://docker-handbook.farhan.dev/) - comprehensive, free, hands-on walkthrough.
- [Docker Katas](https://github.com/eficode-academy/docker-katas) - short exercises to build muscle memory.
- [Docker - Get started](https://docs.docker.com/get-started/) - official walkthrough; do parts 1–4 minimum (run a container, build an image, write a Dockerfile, layer caching).
- [Docker - Build best practices](https://docs.docker.com/build/building/best-practices/) - slim images, multi-stage builds, `.dockerignore`, non-root user.
- [Docker - Python language guide](https://docs.docker.com/language/python/) - Python-specific Dockerfile patterns (matches what Day 1 needs).

## REST APIs & FastAPI

- [MDN - An overview of HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview) - request/response, methods, status codes, headers. 20-min read.
- [FastAPI - Learn](https://fastapi.tiangolo.com/learn/) - up until "Tutorial - User Guide" > "Body - Multiple Parameters"; skim the rest.

## Git & GitHub

- [Pro Git book - chapters 1–3 +6](https://git-scm.com/book/en/v2) - free, official, the canonical reference. The first three chapters cover what you need for the academy. Chapter 6 covers Github.
- [GitHub - Quickstart](https://docs.github.com/en/get-started/quickstart) - repos, branches, pull requests, the GitHub-flavoured side of Git.
- [Learn Git Branching](https://learngitbranching.js.org) - visual and interactive git game.

## SQL & PostgreSQL

Day 2 builds a RAG bot on top of PostgreSQL — keyword search via `tsvector`, semantic search via `pgvector`, then both combined. You don't need to be a DBA, but you should be able to read and write a query with `SELECT`, `WHERE`, `JOIN`, `GROUP BY`, and follow what an `EXPLAIN` plan is telling you.

If your day-to-day is already T-SQL / Spark SQL / Snowflake, the standard-SQL parts are recap — skip to the Postgres-specific bullets.

- [SQLBolt](https://sqlbolt.com/) — the canonical free interactive course. Lessons 1–13 cover everything we'll lean on (filtering, joins, aggregates, subqueries). 2–3 hours end-to-end.
- [PostgreSQL Exercises](https://pgexercises.com/) — same idea but on a real Postgres instance with a single well-designed schema. Do the "Basic", "Joins", and "Aggregates" tracks at minimum.
- [PostgreSQL Tutorial](https://neon.com/postgresql-tutorial) — clean, example-driven reference for the Postgres dialect. Useful when SQLBolt's generic SQL doesn't quite match what `psql` shows you.
- *(optional, for the index-curious)* [Use The Index, Luke!](https://use-the-index-luke.com/) — vendor-agnostic guide to how indexes actually work. Worth a skim if you've never thought about query plans.

## LLMs & prompting

- [OpenAI - Prompt engineering guide](https://platform.openai.com/docs/guides/prompt-engineering) - generic enough to apply to any provider (Azure OpenAI, Anthropic, Gemini).
- [Hugging Face - LLM course, chapter 1](https://huggingface.co/learn/llm-course) - what an LLM actually is, tokens, context windows.

## Cloud - Azure

The academy uses **Azure** for the exercises. You don't need deep expertise, but you should be able to navigate the console and reason about identity, storage, compute, etc.

Free, official, with built-in sandbox environments (no Azure subscription needed for most modules):

- **[Microsoft Learn](https://learn.microsoft.com/training)** - start here
  - [AZ-900: Azure Fundamentals](https://learn.microsoft.com/training/paths/microsoft-azure-fundamentals-describe-cloud-concepts/) - if you've never used Azure
  - [Get Started with AI in Azure](https://learn.microsoft.com/en-us/training/modules/get-started-with-ai-in-azure/) - AI-specific fundamentals in Azure
- [Microsoft Learn - Container Apps overview](https://learn.microsoft.com/en-us/azure/container-apps/overview) - the compute service to run Containers.
- **[Microsoft Applied Skills](https://learn.microsoft.com/credentials/applied-skills/)** - short scenario-based hands-on assessments

---

## Questions

Reach out to `murilo@dataroots.io`. See you in June!
