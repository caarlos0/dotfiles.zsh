# caarlos0/dotfiles test container
FROM ubuntu
MAINTAINER Carlos Alexandro Becker <caarlos0@gmail.com>

RUN apt-get install -y software-properties-common wget zsh git curl

ADD . /root/.dotfiles

RUN cd /root/.dotfiles && \
  git clean -df && \
  git reset --hard HEAD && \
  rm -f ./git/gitconfig.symlink && \
  git remote rm origin

ENTRYPOINT cd ~/.dotfiles && echo "Execute ./script/bootstrap to begin!" && bash
