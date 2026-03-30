.PHONY: docker-build docker-run docker-stop

FE_DIR := bora-fe-service

# Frontend (nginx in bora-fe-service): build context must be FE_DIR so COPY paths resolve
docker-build:
	docker build -f $(FE_DIR)/bora-fe.docker -t bora-fe $(FE_DIR)

docker-run:
	docker run --rm -p 8080:80 bora-fe &

docker-stop:
	@ids=$$(docker ps -q --filter ancestor=bora-fe); [ -n "$$ids" ] && docker stop $$ids || true