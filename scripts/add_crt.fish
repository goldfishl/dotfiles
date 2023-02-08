
read -P "your servername: " -lx name
echo | openssl s_client -servername $name -connect $name:443 2> /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /usr/local/share/ca-certificates/$name.crt
sudo update-ca-certificates
