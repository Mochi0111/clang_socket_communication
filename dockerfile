FROM ubuntu:24.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    tzdata \
    build-essential \
    sudo \
    curl \
    git \
    cmake \
    clang \
    libssl-dev \
    vim \
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

## 任意のディレクトリパス + 作業ディレクトリの所有者を設定
ARG DIR
WORKDIR /${DIR}

COPY . .

## 非rootユーザで実行 
## ※ubuntu24.04イメージの場合, uid=1000のユーザーが"ubuntu"で割当済み.
RUN chown -R ubuntu:ubuntu /${DIR}
USER ubuntu

CMD ["bash"]