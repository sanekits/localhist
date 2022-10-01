# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.234.0/containers/python-3/.devcontainer/base.Dockerfile

# Public build:
# [Choice] Python version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.10, 3.9, 3.8, 3.7, 3.6, 3-bullseye, 3.10-bullseye, 3.9-bullseye, 3.8-bullseye, 3.7-bullseye, 3.6-bullseye, 3-buster, 3.10-buster, 3.9-buster, 3.8-buster, 3.7-buster, 3.6-buster
# docker pull mcr.microsoft.com/vscode/devcontainers/python:0-3.7-bullseye
# FROM artprod.dev.bloomberg.com/dpkg-python-development-base:3.7
FROM localhist-image-base:latest as localhist-image-vscode

ENV ContainerUser=vscode

ENV http_proxy=http://proxy.bloomberg.com:81
ENV https_proxy=http://proxy.bloomberg.com:81
ENV no_proxy=.bcs.bloomberg.com,.dev.bloomberg.com,10.0.0.0/8,100.0.0.0/8
ENV NODE_EXTRA_CA_CERTS=/etc/pki/ca-trust/source/anchors/bloomberg_rootca_v2.crt

RUN [ -d /home/vscode ] || adduser --uid 1000 vscode

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends \
        git \
        python3.8 \
        python3.8-pip \
        vim \
        tree

RUN /opt/bb/bin/python3.8 -m pip install black pytest
