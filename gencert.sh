#!/bin/bash

mkdir certs
openssl genrsa > certs/key.pem
openssl req -new -x509 -key certs/key.pem -out certs/cert.pem -subj "/C=US/ST=test/L=test/O=test/OU=test/CN=localhost"
cat certs/key.pem certs/cert.pem > certs/testcert.pem
rm certs/key.pem certs/cert.pem