FROM jenkins

MAINTAINER j842

USER root

RUN apt-get update && apt-get -y install \
   build-essential \
   g++-multilib \
   libboost-all-dev \
   bc \
   libyaml-cpp-dev \
   && rm -rf /var/lib/apt/lists/*

RUN mkdir /poco && cd /poco && \
   wget http://pocoproject.org/releases/poco-1.7.3/poco-1.7.3.tar.gz && \
   gunzip poco* && \
   tar xvf poco* && \
   cd poco-1.7.3 && \
   ./configure && \
   make -j4 && \
   make install

ADD ["./usrlocalbin","/usr/local/bin"]
RUN chmod a+rx /usr/local/bin/*

USER jenkins

ADD ["./drunner","/drunner"]
