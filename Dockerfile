FROM python:3.8-slim

ENV ROOT /root

#RUN apt-get update && apt-get install -y --no-install-recommends \
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    fish \
    tmux \
    vim \
    direnv \
    fonts-firacode

RUN curl -fsSL https://starship.rs/install.sh | bash -s -- --yes

COPY install.py $ROOT/install.py

WORKDIR $ROOT
RUN $ROOT/install.py

CMD fish

