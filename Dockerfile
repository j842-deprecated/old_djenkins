FROM jenkins

MAINTAINER j842

USER root

RUN apt-get update && apt-get -y install \
   build-essential \
   g++-multilib \
   bc \
   libyaml-cpp-dev \
   libpoco-dev \
   && rm -rf /var/lib/apt/lists/*

ADD ["./usrlocalbin","/usr/local/bin"]
RUN chmod a+rx /usr/local/bin/*

USER jenkins

ADD ["./drunner","/drunner"]
