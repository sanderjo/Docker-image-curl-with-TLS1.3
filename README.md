# Docker-image-curl-with-TLS1.3
Docker image with curl with TLS1.3

Create image:
```
sudo docker build --no-cache  -t="curl-with-tls13" .
```

Test which TLS is spoken by a site:
```
sudo docker run curl-with-tls13  bash -c "/test_TLS.sh tls13.crypto.mozilla.org"
```
with result:
```
tls13.crypto.mozilla.org* SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256
```


Longer stuff

Run

Test which TLS is spoken by www.google.com:
```
sudo docker run curl-with-tls13  bash -c "/git/curl/src/curl -v https://www.google.com/ 2>&1 | grep 'connection using' "
```

Result:
```
sudo docker run curl-with-tls13  bash -c "/git/curl/src/curl -v https://www.google.com/ 2>&1 | grep 'connection using' "
* SSL connection using TLSv1.3 / TLS_AES_256_GCM_SHA384
```
... so: TLS1.3

Interactive:

```
sudo docker run -it  curl-with-tls13 /bin/bash
```
... then you can use curl /git/curl/src/curl:
```
root@46c78023aa7b:/# /git/curl/src/curl --version
curl 7.61.0-DEV (x86_64-pc-linux-gnu) libcurl/7.61.0-DEV OpenSSL/1.1.1
Release-Date: [unreleased]
Protocols: dict file ftp ftps gopher http https imap imaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
Features: AsynchDNS IPv6 Largefile NTLM NTLM_WB SSL TLS-SRP UnixSockets HTTPS-proxy 
```
