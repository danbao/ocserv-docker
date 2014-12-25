# Ocserv-rp 
FROM ubuntu:latest 
MAINTAINER rp <rphoho@gmail.com>

# Install all required library
RUN apt-get update
RUN apt-get install build-essential libwrap0-dev libpam0g-dev libdbus-1-dev libreadline-dev libnl-route-3-dev  libpcl1-dev libopts25-dev autogen libgnutls28 libgnutls28-dev libseccomp-dev iptables wget gnutls-bin libprotobuf-c0-dev protobuf-c-compiler libprotobuf-dev protobuf-compiler libprotoc-dev libtalloc-dev libhttp-parser-dev -y


# Install the ocserv latest version
RUN cd /root && wget http://www.infradead.org/ocserv/download.html && export ocserv_version=$(cat download.html | grep -o '[0-9]\.[0-9]\.[0-9]') \
    && wget ftp://ftp.infradead.org/pub/ocserv/ocserv-$ocserv_version.tar.xz && tar xvf ocserv-$ocserv_version.tar.xz \
    && && cd ocserv-$ocserv_version && ./configure --prefix=/usr --sysconfdir=/etc && make && make install \
    && rm -rf /root/download.html && rm -rf ocserv-*

# Gernerating the CA
RUN cd /root && wget https://raw.githubusercontent.com/aerok/ocserv-docker/master/cert-template.sh && chmod a+x ./cert-template.sh && ./cert-template.sh
RUN certtool --generate-privkey --outfile ca-key.pem && certtool --generate-self-signed --load-privkey ca-key.pem --template ca.tmpl --outfile ca-cert.pem && certtool --generate-privkey --outfile server-key.pem && certtool --generate-certificate --load-privkey server-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template server.tmpl --outfile server-cert.pem