FROM rockylinux:8.5

RUN dnf install -y epel-release && \
  sed -i 's|^metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-$releasever&arch=$basearch&infra=$infra&content=$contentdir|baseurl=https://dl.fedoraproject.org/pub/archive/epel/8.5.2022-05-10/Everything/x86_64/|' /etc/yum.repos.d/epel.repo && \
  dnf update -y && \
  dnf install -y \
    openssh-clients \
    python38 \
    python38-pip \
    python38-wheel \
    python3-argcomplete \
    rust \
    cargo \
    curl \
    sshpass && \
  dnf clean all

RUN alternatives --set python /usr/bin/python3.8 && \
  alternatives --set python3 /usr/bin/python3.8

RUN pip3 install \
    ansible==5.6.0 \
    dumb-init && \
    rm -rf /root/.cache

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/dumb-init", "--" ]
CMD ["/usr/local/bin/entrypoint.sh"]

RUN mkdir -p /root/.ssh /root/src && \
  chmod 0600 /root/.ssh

VOLUME /root/.ssh

VOLUME /root/src

WORKDIR /root/src
