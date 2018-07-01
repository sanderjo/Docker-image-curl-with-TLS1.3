# Version: 0.0.1
FROM debian:experimental

MAINTAINER Sander "superkoning@caiway.net"

RUN sed -i -e 's/main/main contrib non-free/' /etc/apt/sources.list
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -t experimental install openssl ca-certificates nano git autoconf libtool make libssl-dev -y

RUN mkdir /git && cd /git && git clone https://github.com/curl/curl.git
RUN cd /git/curl && ls -al && \
	cd /git/curl/ && ls -al && \
	./buildconf && ./configure --with-ssl && make

RUN printf 'printf $1 \n /git/curl/src/curl -v https://$1/ 2>&1 | grep "connection using" \n' > /test_TLS.sh
RUN chmod +x /test_TLS.sh
#RUN echo "printf $1 \n /git/curl/src/curl -v https://$1/ 2>&1 | grep 'connection using'" > /test_TLS.sh
RUN /test_TLS.sh www.google.com
RUN /test_TLS.sh tls13.crypto.mozilla.org
RUN /test_TLS.sh www.appelboor.com

CMD /test_TLS.sh tls13.crypto.mozilla.org

