if command -q kubectx
	abbr --add kx kubectx
	abbr --add kn kubens
end

abbr --add k kubectl
abbr --add sk 'kubectl -n kube-system'
abbr --add ke 'EDITOR=vim kubectl edit'
abbr --add kdebug 'kubectl run -i -t debug --rm --image=caarlos0/debug --restart=Never'
abbr --add knrunning 'kubectl get pods --field-selector=status.phase!=Running'
abbr --add kfails 'kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l'
abbr --add kimg "kubectl get deployment --output=jsonpath='{.spec.template.spec.containers[*].image}'"
abbr --add kvs "kubectl view-secret"
abbr --add kgno 'kubectl get no --sort-by=.metadata.creationTimestamp'
abbr --add kdrain 'kubectl drain --ignore-daemonsets --delete-local-data'
