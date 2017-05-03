#!/bin/sh
alias k='kubectl'
alias sk='k -n kube-system'
alias kpods='k get pods'
alias kdescb='k describe pods'
alias klogs='k logs -f --tail 500'
alias kscale-zero='k scale deployment --replicas 0'
alias kscale-one='k scale deployment --replicas 1'
