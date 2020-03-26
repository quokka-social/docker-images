FROM buildpack-deps:buster AS janus-builder

COPY janus-builder/build-scripts /root/build-scripts

WORKDIR /root

RUN ./build-scripts/00_prepare.sh

RUN ./build-scripts/10_boringssl.sh
RUN ./build-scripts/11_usrsctp.sh
RUN ./build-scripts/12_libwebsockets.sh
RUN ./build-scripts/13_libnice.sh

RUN ./build-scripts/20_janus.sh


FROM node:13 AS web-client-builder

COPY web-client /root/web-client

WORKDIR /root/web-client

RUN npm ci
RUN npm run build


FROM debian:buster

LABEL version="0.1.0"
LABEL maintainer="Maximilian Köhl <mail@koehlma.de>"

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y \
    libmicrohttpd12 \
    libjansson4 \
    libssl1.1 \
    libsrtp2-1 \
    libsofia-sip-ua0 \
    libcurl4 \
    libopus0 \
    libogg0 \
    libconfig9 \
    libavutil56 \
    libavcodec58 \
    libavformat58 \
    nginx

COPY --from=janus-builder /opt /opt

COPY --from=web-client-builder /root/web-client/dist /opt/quokka/web-client

COPY quokka /opt/quokka

CMD /opt/quokka/run_quokka.sh
