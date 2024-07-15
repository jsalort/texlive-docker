FROM ubuntu:24.04 AS base
LABEL org.opencontainers.image.authors="julien.salort@ens-lyon.fr"

RUN apt update && \
    apt upgrade -y
RUN echo Europe/Paris > /etc/timezone && \
    ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    apt install -y wget perl-modules-5.38 \
                   make ghostscript vim-nox \
                   adduser

# Create the liveuser user

ARG USER_NAME=liveuser
ARG USER_HOME=/home/liveuser
ARG USER_ID=1001
ARG USER_GECOS=liveuser
ARG TARGETARCH

RUN adduser \
  --home "$USER_HOME" \
  --uid $USER_ID \
  --gecos "$USER_GECOS" \
   --disabled-password \
  "$USER_NAME"

# Install TL

COPY texlive.profile /

RUN echo 2024-07-15

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xzf install-tl-unx.tar.gz && \
    install-tl*/install-tl -profile texlive.profile && \
    rm -fr install-tl-* && \
    rm texlive.profile

USER "$USER_NAME"
ENV HOME="$USER_HOME"
ENV MANPATH="/usr/local/texlive/2024/texmf-dist/doc/man:${MANPATH}"
ENV INFOPATH="/usr/local/texlive/2024/texmf-dist/doc/info:${INFOPATH}"

FROM base AS branch-amd64
RUN PATH=/usr/local/texlive/2024/bin/x86_64-linux luaotfload-tool --update --force -vv
ENV PATH="/usr/local/texlive/2024/bin/x86_64-linux:${PATH}"

FROM base AS branch-arm64
RUN PATH=/usr/local/texlive/2024/bin/aarch64-linux luaotfload-tool --update --force -vv
ENV PATH="/usr/local/texlive/2024/bin/aarch64-linux:${PATH}"

FROM branch-${TARGETARCH} AS final
WORKDIR "$USER_HOME"
