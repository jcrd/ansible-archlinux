lint:
	ansible-lint workstation.yml

# Install on real machine.
baremetal: lint
	ansible-playbook workstation.yml

# Test basic configuration, without installing packages.
container: lint
	ansible-playbook --skip-tags packages,dbus container.yml

# Test full install, without interacting with dbus (i.e. systemctl, etc).
container-all: lint
	ansible-playbook --skip-tags dbus container.yml

# Run container target in docker.
test:
	docker run --rm -v $(shell pwd):/ansible -w /ansible \
		supplantr/ansible-archlinux:latest make container

.PHONY: lint container container-all test
