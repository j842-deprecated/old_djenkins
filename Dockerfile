FROM jenkins

MAINTAINER j842

USER root

RUN apt-get update && apt-get -y install build-essential g++-multilib libboost-all-dev && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install bc && rm -rf /var/lib/apt/lists/*

USER jenkins

ADD ["./drunner","/drunner"]
ADD ["./usrlocalbin","/usr/local/bin"]
