FROM ansible/awx_task:3.0.0

USER root

RUN adduser ansible

USER ansible

RUN mkdir -p /home/ansible/.ssh /home/ansible/src

VOLUME /home/ansible/.ssh

VOLUME /home/ansible/src

WORKDIR /home/ansible/src
