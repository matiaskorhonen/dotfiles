# Show the certificate for a given hostname
function checkcert() {
  if [ -z "$1" ]
  then
    echo "Usage: checkcert HOSTNAME"
  fi

  echo | \
    openssl s_client -servername "$1" -connect "$1:443" 2>/dev/null | \
    openssl x509 -text -noout
}
