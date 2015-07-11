#!/bin/sh
alias gotest='go test -covermode=count -coverprofile=coverage.out'
alias gocover='gotest && go tool cover -html=coverage.out'
