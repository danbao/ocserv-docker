#!/bin/sh

server_ip="120.27.50.254"
echo $server_ip

mkdir certs
cd ./certs

cat >ca.tmpl << _EOF_
cn = "VPN CA" 
organization = "Big Corp" 
serial = 1 
expiration_days = 3650 
ca 
signing_key 
cert_signing_key 
crl_signing_key 
_EOF_

cat >server.tmpl << _EOF_ 
cn = "$server_ip" 
organization = "VPN SERVER" 
expiration_days = 3650
signing_key 
encryption_key #only if the generated key is an RSA one 
tls_www_server 
_EOF_

cat >user.tmpl << _EOF_
cn = "user" 
unit = "admins" 
expiration_days = 9999 
signing_key 
tls_www_client 
_EOF_
