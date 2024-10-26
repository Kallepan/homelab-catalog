FROM alpine:latest AS base


ARG OPM_VERSION

WORKDIR /tmp

# Install build dependencies
RUN apk add --no-cache \
    curl

# Download and install opm
RUN curl -LO https://github.com/operator-framework/operator-registry/releases/download/${OPM_VERSION}/linux-amd64-opm

FROM docker:cli

COPY --from=base /tmp/linux-amd64-opm /usr/local/bin/opm
RUN chmod +x /usr/local/bin/opm
