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

.PHONY: lint container container-all
