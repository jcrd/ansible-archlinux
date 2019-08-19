FROM archlinux/base

ENV CONTAINER docker

COPY roles/base/files/update-mirrorlist.sh /usr/local/bin/

RUN pacman -Sy --noconfirm reflector
RUN update-mirrorlist.sh
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm make git sudo ansible ansible-lint

RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts
