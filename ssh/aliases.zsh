#!/bin/zsh

alias c_dokku="ssh root@192.241.182.40"
alias c_jenkins="ssh root@208.68.36.164"
alias c_fluig="ssh root@172.18.192.151"

# send the key to the server
# usage:
#       send_key user@server
function send_key {
  cat ~/.ssh/id_rsa.pub | ssh ${1} "cat >> ~/.ssh/authorized_keys"
}
