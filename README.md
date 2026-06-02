# setup-check

A tiny reference repo for confirming a developer's environment is ready before day one.
It exercises the whole **Docker + [uv](https://docs.astral.sh/uv/) + Git/GitHub** toolchain
end to end, so a single `git clone` and four commands tell you whether someone is good to go.

There are two layers to validating a setup:

1. **Quick per-tool checks** — fast commands anyone can paste into a terminal.
2. **End-to-end smoke test** — clone this repo and run four commands that
   confirm the whole chain works *together*.

> 📋 This repo covers the **tooling** prerequisites. For the full picture — required setup,
> prerequisite knowledge, and refresher tracks — see the
> [Agentic AI Academy prep package](prep-package.md).

---

## 1. Quick per-tool check

Run each block in a terminal. Every command should succeed without an error.

```bash
# Docker — installed AND the daemon is actually running
docker --version
docker run --rm hello-world

# uv — installed and able to manage Python
uv --version
uv python install 3.11
uv python list                 # should show 3.11+

# Git + GitHub access (auth is the usual failure point, not git itself)
git --version
ssh -T git@github.com          # SSH: expect a "successfully authenticated" message

# Azure CLI — just needs to be *installed*; account access comes on day 1
az --version
```

> **No need for `az` sign-in check** Azure account access is handed out on day 1, so don't
> expect to be signed in yet — having the `az` CLI installed is all you need beforehand.

---

## 2. End-to-end smoke test

Clone this repo and run the four commands below. Green on all four = environment confirmed.

```bash
git clone git@github.com:datarootsio/a3-setup-check.git && cd a3-setup-check
uv sync                          # uv resolves + installs into the right Python
uv run pytest -q                 # runs the suite locally
docker build -t setup-check .    # confirms you can *build* images
docker run --rm setup-check      # runs the same tests inside the container
```

Why four separate commands? Each catches a distinct failure mode:

| Step | Confirms |
| --- | --- |
| `git clone` | Git works **and** you have access to the (org) repo |
| `uv sync` | uv resolves dependencies and provisions the right Python |
| `uv run pytest` | The toolchain runs code locally |
| `docker build` | You can *build* images (separate from running them) |
| `docker run` | The container runtime works and runs the same tests |

---

## What's in the repo

It's intentionally tiny — three files do all the work:

```
setup-check/
├── pyproject.toml      # project + a single dev dependency (pytest)
├── Dockerfile          # python:3.11-slim + uv, runs the tests as its CMD
└── tests/
    └── test_smoke.py   # asserts Python >= 3.11
```

The Dockerfile pulls the `uv`/`uvx` binaries straight from the official
`ghcr.io/astral-sh/uv` image, installs dependencies in a cached layer, and runs
`uv run pytest -q` as its default command — so building and running the image
re-validates the exact same flow you ran locally.

---

## Notes / variations

A couple of choices are baked into the checks above. Swap them if your environment differs:

- **uv-managed vs. system Python.** By default we let **uv own the 3.11 runtime**
  (`uv python install 3.11`) — the cleaner, most reproducible path. If you must use a
  system-installed Python instead, replace that line with `python3.11 --version` and add
  `uv venv --python 3.11`.
- **SSH vs. HTTPS for GitHub.** The quick check uses SSH (`ssh -T git@github.com`).
  If you authenticate over **HTTPS + a personal access token (PAT)** instead, drop the
  `ssh -T` line and do a test clone of a target repo — the auth mechanism is different.
