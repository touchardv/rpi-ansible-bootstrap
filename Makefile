IMAGE := touchardv/ansible
TAG := latest
UNAME_S := $(shell uname -s)

build:
	podman build -t $(IMAGE):$(TAG) .

clean:
	podman image rm $(IMAGE):$(TAG)

setup:
	rm -rf dependencies/*
	ansible-galaxy collection install -r requirements.yml --collections-path ./dependencies/collections
	ansible-galaxy role install -r requirements.yml --roles-path ./dependencies/roles

shell:
	podman run -it --rm \
	-h ansible \
	-u root \
	-e HISTFILE=/root/src/.bash_history \
	-v $(HOME)/.ssh:/root/.ssh \
	-v `pwd`:/root/src \
	$(IMAGE):$(TAG)

.DEFAULT_GOAL := build
