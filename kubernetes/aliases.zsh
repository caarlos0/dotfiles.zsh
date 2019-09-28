#!/bin/sh

alias kx='kubectx'
alias kn='kubens'

alias k='kubectl'
alias sk='kubectl -n kube-system'
alias ke='EDITOR=vim kubectl edit'
alias klbaddr="kubectl get svc -ojsonpath='{.status.loadBalancer.ingress[0].hostname}'"

alias kdebug='kubectl run -i -t debug --rm --image=caarlos0/debug --restart=Never'
alias knrunning='kubectl get pods --field-selector=status.phase!=Running'
alias kfails='kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l'
alias kimg="kubectl get deployment --output=jsonpath='{.spec.template.spec.containers[*].image}'"
alias kvs="kubectl view-secret"

kenc() {
	# shellcheck disable=SC2039
	echo -n "$@" | base64
}

kdec() {
	echo "$@" | base64 -D
}

# create new k3d test cluster
ktc() {
	k3d create --name test --wait 0
	export KUBECONFIG
	KUBECONFIG="$(k3d get-kubeconfig --name='test')"
}

# create new k3d test cluster and set up helm on it
ktch() {
	ktc
	kubectl create serviceaccount --namespace kube-system tiller
	kubectl create clusterrolebinding tiller-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
	helm init --service-account tiller --upgrade --wait
}
