#!/bin/sh
alias k='kubectl'
alias sk='k -n kube-system'
alias kpods='k get pods'
alias kdescb='k describe pods'
alias klogs='k logs -f --tail 500'
alias k-scale-zero='k scale deployment --replicas 0'
alias k-scale-one='k scale deployment --replicas 1'
