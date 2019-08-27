build:
	docker build -t touchardv/ansible .

clean:
	docker rmi -f touchardv/ansible

shell:
	docker run -it --rm \
	-v $(HOME)/.ssh:/home/ansible/.ssh \
	-v `pwd`:/home/ansible/src touchardv/ansible \
	bash
