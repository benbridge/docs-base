#
# See the top level Makefile in https://github.com/docker/docker for usage.
#
FROM debian:jessie
MAINTAINER Mary Anthony <mary@docker.com> (@moxiegirl)

RUN apt-get update \
	&& apt-get install -y \
		gettext \
		git \
		wget \
		libssl-dev \
		make \
		python-dev \
		python-pip \
		python-setuptools \
		subversion-tools\
		vim-tiny \
		ssed \
		curl

# Required to publish the documentation.
# The 1.4.4 version works: the current versions fail in different ways
# TODO: Test to see if the above holds true
RUN pip install awscli==1.4.4 pyopenssl==0.12

RUN curl -sSL -o /usr/local/bin/hugo https://github.com/SvenDowideit/hugo/releases/download/v0.14%2Bgithublinking/hugo
#RUN curl -sSL -o /usr/local/bin/hugo https://github.com/SvenDowideit/hugo/releases/download/docker-1/hugo
RUN chmod 755 /usr/local/bin/hugo

#######################
# Copy the content and theme to the container
#######################
WORKDIR /docs
COPY . /docs

EXPOSE 8000






