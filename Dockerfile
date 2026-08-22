FROM debian:bookworm-slim AS builder

ARG MISE_VERSION=2026.6.14
ARG MISE_TOOLS="terraform terragrunt"

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
      ca-certificates \
      curl \
      git \
      unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl --fail --silent --show-error --location \
      "https://github.com/jdx/mise/releases/download/v${MISE_VERSION}/mise-v${MISE_VERSION}-linux-x64" \
      --output /usr/local/bin/mise \
    && chmod 0755 /usr/local/bin/mise

WORKDIR /workspace
COPY .mise.toml .

ENV MISE_DATA_DIR=/opt/mise
RUN mise install --yes ${MISE_TOOLS} \
    && mkdir --parents /toolchain/usr/local/bin \
    && for tool in ${MISE_TOOLS}; do \
         cp "$(mise which "$tool")" "/toolchain/usr/local/bin/$tool"; \
       done

FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
      bash \
      ca-certificates \
      git \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /toolchain/usr/local/bin/ /usr/local/bin/
ENV PATH=/usr/local/bin:$PATH
