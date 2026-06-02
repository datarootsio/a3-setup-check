FROM python:3.11-slim

# Pull the uv/uvx binaries straight from the official image — no pip bootstrap needed.
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

# Install dependencies first (cached layer). uv.lock is optional — the glob keeps
# the build working whether or not a lock file has been committed yet.
COPY pyproject.toml uv.lock* ./
RUN uv sync --no-install-project

# Then copy the project and finish the sync.
COPY . .
RUN uv sync

# Default command runs the test suite inside the container.
CMD ["uv", "run", "pytest", "-q"]
