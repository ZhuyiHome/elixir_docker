FROM centos:7

RUN yum install -y epel-release gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel autoconf java-1.8.0-openjdk-devel git wget wxBase.x86_64 && \
    yum update -y && \
    wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm && \
    rpm -Uvh erlang-solutions-1.0-1.noarch.rpm && \
    yum update -y && \
    yum install -y erlang

ENV LANG="en_US.UTF-8"
ENV LC_CTYPE="en_US.UTF-8"
ENV LC_NUMERIC="en_US.UTF-8"
ENV LC_TIME="en_US.UTF-8"
ENV LC_COLLATE="en_US.UTF-8"
ENV LC_MONETARY="en_US.UTF-8"
ENV LC_MESSAGES="en_US.UTF-8"
ENV LC_PAPER="en_US.UTF-8"
ENV LC_NAME="en_US.UTF-8"
ENV LC_ADDRESS="en_US.UTF-8"
ENV LC_TELEPHONE="en_US.UTF-8"
ENV LC_MEASUREMENT="en_US.UTF-8"
ENV LC_IDENTIFICATION="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"

RUN wget https://github.com/elixir-lang/elixir/archive/v1.5.2.tar.gz && \
    tar -zxvf v1.5.2.tar.gz -C /usr/local && \
    localedef -i en_US -f UTF-8 en_US.UTF-8 && \
    cd /usr/local/elixir-1.5.2 && \
    make clean test

ENV PATH="/usr/local/elixir/bin:${PATH}"
