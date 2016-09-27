FROM ubuntu
MAINTAINER neoul <neoul@ymail.com>
RUN apt-get update
RUN apt-get -y install make
RUN apt-get update
RUN apt-get -y install gcc 
RUN apt-get -y install libtool
RUN apt-get -y install flex bison
RUN apt-get -y install vim
RUN apt-get -y install subversion
RUN svn checkout http://svn.ibr.cs.tu-bs.de/software-ibr-1999-libsmi/trunk libsmi
RUN apt-get -y install autoconf
WORKDIR /libsmi
RUN ./autogen.sh
RUN ./configure --enable-static --disable-shared
RUN make
#RUN make check - A number of tests failed. 
RUN make install
WORKDIR /
VOLUME ["/mib", "/yang"]
COPY install/smidump.sh /
CMD ["/smidump.sh"]
