FROM debian:10

RUN apt-get clean all && apt-get update && apt-get install -y \
    biber \
    latexmk \
    make \
    texlive-full \
    texlive-fonts-extra \
    texlive \
    pandoc \
    latex2rtf \
    wget \
    && rm -rf /var/lib/apt/lists/*

ARG USER_NAME=latex
ARG USER_HOME=/home/latex
ARG USER_ID=1000
ARG USER_GECOS=LaTeX

RUN adduser \
  --home "$USER_HOME" \
  --uid $USER_ID \
  --gecos "$USER_GECOS" \
  --disabled-password \
  "$USER_NAME"

# RUN mkdir -p /root/texmf \
#     && tlmgr init-usertree \
#     && tlmgr option repository ftp://tug.org/historic/systems/texlive/2018/tlnet-final \
#     && tlmgr update --all

# RUN tlmgr install fira
