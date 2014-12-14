transfer() {
  curl --upload-file "./$1" "https://transfer.sh/$1"
}
alias transfer=transfer
