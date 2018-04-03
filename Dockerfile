FROM ubuntu:18.04
MAINTAINER Samina Fu <sufuf3[at]gmail.com>

ENTRYPOINT bash

# Env package install
ENV UBUNTU_APT_SITE free.nchc.org.tw
RUN sed -i 's/^deb-src\ /\#deb-src\ /g' /etc/apt/sources.list
RUN sed -E -i "s/([a-z]+.)?archive.ubuntu.com/$UBUNTU_APT_SITE/g" /etc/apt/sources.list
RUN sed -i "s/security.ubuntu.com/$UBUNTU_APT_SITE/g" /etc/apt/sources.list
RUN apt update         && \
    apt upgrade -y     && \
    apt install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
        locales dnsutils openssh-server dpkg coreutils util-linux passwd bsdutils file \
        openssl ca-certificates ssh wget curl cpio dnsutils patch sudo sysstat vnstat  \
        htop dstat vim nano tmux ftp tree aptitude colordiff curl fail2ban mtr-tiny    \
        ntpdate git p7zip-full nmap apt-file command-not-found unzip tcpdump iftop cmake \
        iotop xterm unattended-upgrades ppa-purge jq iperf traceroute whois lsof iputils-ping \
        ufw make build-essential bash-completion python-pip python-dev build-essential \
        python-setuptools software-properties-common python-software-properties iperf3 \
        libsqlite3-dev libzmq3-dev python3 python3-pip python3-dev && \
    rm -rf /var/lib/apt/lists/*


# pip install packages
RUN python -m pip install --upgrade pip
RUN pip install urllib3 virtualenv

# Install python3 & pip package
RUN pip3 install -U setuptools
