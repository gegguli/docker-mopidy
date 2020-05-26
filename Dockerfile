FROM alpine:edge

RUN mkdir /etc/default && mkdir /config

COPY mopidy.conf /etc/default/mopidy.conf
COPY mopidy.conf /config/mopidy.conf
COPY entrypoint.sh /entrypoint.sh

RUN apk update && apk upgrade 
RUN apk add --no-cache mopidy
# This is stupid
RUN ln -s /usr/lib/libpython3.8.so.1.0 /usr/lib/libpython3.8.so
RUN pip3 install --upgrade pip
RUN pip install Mopidy-MPD
RUN pip install Mopidy-Scrobbler
RUN pip install Mopidy-Local
RUN pip install Mopidy-Mowecl
RUN pop install Mopidy-Party
RUN pip install --pre Mopidy-YouTube


VOLUME ["/config", "/var/lib/mopidy"]

EXPOSE 6600 6680 5555/udp

ENTRYPOINT ["/entrypoint.sh"]
