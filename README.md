# Bora Orneles — Customer Area Frontend (UI)

Static **HTML**, **CSS**, and **JavaScript** for the customer registration and travel-plan flows. The app is served by **nginx** in Docker (`bora-fe.docker`) and calls the **Customer Area API** (Flask backend); see the companion repository for the server.

## Repository layout

| Path | Purpose |
|------|---------|
| `Makefile` | Docker build, run, and stop for the frontend image |
| `bora-fe-service/index.html` | Main page and forms |
| `bora-fe-service/styles.css` | Layout and styling |
| `bora-fe-service/scripts.js` | API client (`API_BASE_URL`), ViaCEP integration, form handling |
| `bora-fe-service/images/` | Static images copied into the nginx document root |
| `bora-fe-service/bora-fe.docker` | Docker image for the frontend (nginx) |

## Prerequisites

- Docker (recommended workflow)
- Optional: `make`
- **Backend API** running and reachable at the URL configured in `bora-fe-service/scripts.js` (`API_BASE_URL`, default `http://0.0.0.0:5001`). For local development, run the API from the backend repository first.

## Local setup

There is no Node or Python install step.
Use the Docker workflow below to serve the site over HTTP so browser requests to the API match your `API_BASE_URL`.

## Docker

From the repository root (build context must be `bora-fe-service/` so `COPY` paths in the Dockerfile resolve):

```bash
make docker-build
make docker-run
```

The container maps host port **8080** to nginx on port **80**. 

Open on a browser:

- [http://127.0.0.1:8080](http://127.0.0.1:8080)

Stop containers that use the `bora-fe` image:

```bash
make docker-stop
```

## Makefile reference

Targets are listed in alphabetical order (same as the `Makefile`).

| Target | Description |
|--------|-------------|
| `docker-build` | Build Docker image `bora-fe` (context: `bora-fe-service/`) |
| `docker-run` | Run container on port 8080→80 (`bora-fe`) |
| `docker-stop` | Stop running containers whose image is `bora-fe` (ancestor filter) |
