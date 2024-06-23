# Define variables
IMAGE_NAME := my-fastapi-app
CONTAINER_NAME := fastapi-container
PORT := 8000

# Build Docker image
build:
	sudo docker build -t $(IMAGE_NAME) .

# Run Docker container
run:
	sudo docker run -d -p $(PORT):$(PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Stop Docker container
stop:
	sudo docker stop $(CONTAINER_NAME)

# Remove Docker container
remove:
	sudo docker rm $(CONTAINER_NAME)

# Clean up Docker images
clean:
	sudo docker rmi $(IMAGE_NAME)

# View Docker container logs
logs:
	sudo docker logs $(CONTAINER_NAME)

# Restart Docker container
restart: stop run

# Run all steps
all: build run

# Help
help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  build       Build Docker image"
	@echo "  run         Run Docker container"
	@echo "  stop        Stop Docker container"
	@echo "  remove      Remove Docker container"
	@echo "  clean       Clean up Docker images"
	@echo "  logs        View Docker container logs"
	@echo "  restart     Restart Docker container"
	@echo "  all         Build and run Docker container"
	@echo "  help        Show this help message"

# Default target
.DEFAULT_GOAL := help

