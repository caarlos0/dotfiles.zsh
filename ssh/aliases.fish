function pubkey
	more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'
end
