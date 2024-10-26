#!/bin/bash

### Install the Operator SDK ###
# Adapted from https://sdk.operatorframework.io/docs/installation/
OPM_VERSION=v1.47.0
ARCH=$(case $(uname -m) in x86_64) echo -n amd64 ;; aarch64) echo -n arm64 ;; *) echo -n $(uname -m) ;; esac)
OS=$(uname | awk '{print tolower($0)}')

# Install OPM
OPM_DL_URL=https://github.com/operator-framework/operator-registry/releases/download/${OPM_VERSION}/${OS}-${ARCH}-opm

curl -LO ${OPM_DL_URL} \
    && chmod +x ${OS}-${ARCH}-opm \
    && sudo mv ${OS}-${ARCH}-opm /usr/local/bin/opm
