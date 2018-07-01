# Version: 0.0.1
FROM debian:experimental

MAINTAINER Sander "superkoning@caiway.net"

RUN sed -i -e 's/main/main contrib non-free/' /etc/apt/sources.list
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -t experimental install openssl ca-certificates nano git autoconf libtool make libssl-dev -y

RUN mkdir /git
RUN cd /git

RUN git clone https://github.com/curl/curl.git
RUN cd curl/
#RUN ./buildconf
#RUN ./configure --with-ssl
#RUN make
#RUN /git/src/curl -v https://www.google.com/ > /dev/null

CMD /git/src/curl -v https://tls13.crypto.mozilla.org/ > /dev/null
