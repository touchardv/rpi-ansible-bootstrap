#!/bin/bash

DHCP_IP_ADDRESS=$1

ansible-playbook -i ${DHCP_IP_ADDRESS}, playbooks/bootstrap.yml --ask-pass