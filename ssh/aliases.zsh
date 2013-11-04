#!/bin/zsh

# send the key to the server
# usage:
#       send_key user@server
function send_key {
  cat ~/.ssh/id_rsa.pub | ssh ${1} "cat >> ~/.ssh/authorized_keys"
}
