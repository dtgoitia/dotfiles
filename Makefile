CONTAINER_NAME=dotfiles
IMAGE_NAME=dotfiles

build:
	docker build --tag=$(IMAGE_NAME) .

run:
	docker run -it --name $(CONTAINER_NAME) $(IMAGE_NAME) || true

cleanup-docker-containers:
	docker kill $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

delete-docker-images:
	docker rmi $(docker images -f dangling=true -q) || true
	docker rmi $(IMAGE_NAME):latest || true

cleanup:
	make cleanup-docker-containers
	make delete-docker-images

re-run:
	make cleanup-docker-containers
	# make delete-docker-images
	make build
	make run

