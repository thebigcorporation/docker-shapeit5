# SPDX-License-Identifier: GPL-2.0
ARG BASE_IMAGE
FROM $BASE_IMAGE

LABEL org.opencontainers.image.title="Shapeit5 base image"
LABEL org.opencontainers.image.description="Shapeit5 from https://github.com/odelaneau/shapeit5"
LABEL org.opencontainers.image.url="https://github.com/hihg-um/docker-shapeit5"
LABEL org.opencontainers.image.version="5.1.1"
LABEL org.opencontainers.image.licences="GPL v2"
LABEL org.opencontainers.image.vendor="The John P. Hussman Institute for Human Genomics at The University of Miami Miller School of Medicine"
LABEL org.opencontainers.image.authors="kms309@med.miami.edu"

RUN apt -y update && apt -y upgrade && \
	DEBIAN_FRONTEND=noninteractive apt -y install \
		bzip2 curl ca-certificates \
		libboost-filesystem1.74.0 libboost-iostreams1.74.0 \
		libboost-program-options1.74.0 libboost-thread1.74.0 \
		libcurl4 libgcrypt20 libhts3 libssl3 liblzma5
