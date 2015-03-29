# caarlos0/dotfiles test container
FROM ubuntu
MAINTAINER Carlos Alexandro Becker <caarlos0@gmail.com>

RUN apt-get install -y software-properties-common wget zsh git curl vim
RUN add-apt-repository -y ppa:webupd8team/atom
RUN apt-get update
RUN apt-get -y install atom

ADD . /root/.dotfiles

RUN cd /root/.dotfiles && git clean -df && git reset --hard HEAD && git remote rm origin
