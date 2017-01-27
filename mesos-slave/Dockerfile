FROM nvidia/cuda:8.0-runtime-ubuntu14.04

# Configure apt and the system for the installation of docker-engine and mesos
RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get install -yq -qq --no-install-recommends \
    apt-transport-https \
    ca-certificates \
 && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
 && echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list \
 && echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install mesos using force-yes
# Install docker-engine and other packages
RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get install -yq -qq --no-install-recommends --force-yes \
    mesos=1.1.0-2.0.107.ubuntu1404 \
 && DEBIAN_FRONTEND=noninteractive apt-get install -yq -qq --no-install-recommends \
    docker-engine=1.11.2-0~trusty \
    curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["mesos-agent"]
