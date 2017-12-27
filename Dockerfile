# medirect_etools
#
# VERSION               0.2

FROM      alpine:3.6
RUN mkdir /fh
RUN mkdir /app
RUN apk add --no-cache wget git build-base python3-dev=3.6.1-r3
RUN mkdir /src
WORKDIR /src
RUN apk add --no-cache python3=3.6.1-r3 perl=5.24.3-r1 perl-html-parser=3.72-r0 perl-lwp-protocol-https=6.06-r1 
RUN wget ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/edirect.tar.gz && tar xzvf edirect.tar.gz
RUN cp /src/edirect/* /usr/local/bin/ 
RUN rm -rf /src/edirect/ && rm edirect.tar.gz
RUN pip3 install medirect
RUN apk del wget git build-base python3-dev
WORKDIR ~