FROM ubuntu:14.10
MAINTAINER Carlos Alexandro Becker <caarlos0@gmail.com>
RUN apt-get install -y wget zsh git curl vim
ADD . /root/.dotfiles
RUN cd /root/.dotfiles && git clean -df && git reset --hard HEAD
# ENV BRANCH master
# RUN bash -c "$(wget -O - https://raw.githubusercontent.com/caarlos0/dotfiles/$BRANCH/script/install)"
# RUN cd ~/.dotfiles && ./bin/dot
