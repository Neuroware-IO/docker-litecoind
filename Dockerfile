FROM ubuntu:xenial
MAINTAINER Yu Jin

ARG appdir=/usr/local/litecoin
ARG user_id=1000
ARG group_id=1000

ENV HOME /litecoin

ENV USER $user_id
ENV GROUP $group_id

RUN groupadd -g $group_id litecoin \
	&& useradd -u $user_id -g litecoin -s /bin/bash -m -d $HOME litecoin

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		wget

RUN mkdir -p $appdir
RUN cd $appdir && \
		wget -qO- https://download.litecoin.org/litecoin-0.14.2/linux/litecoin-0.14.2-x86_64-linux-gnu.tar.gz \
		| tar --strip-components=1 -xz \
		# && chown -R ${user_id} $appdir/bin/* \
		&& ln -s $appdir/bin/* /usr/local/bin/

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.10
RUN set -x \
		&& dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
		&& wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
		&& wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
		&& export GNUPGHOME="$(mktemp -d)" \
		&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
		&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
		&& rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
		&& chmod +x /usr/local/bin/gosu \
		&& gosu nobody true

RUN apt-get purge -y --auto-remove \
		ca-certificates \
		wget \
		&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD scripts/litecoind_start.sh /usr/local/bin
RUN chmod +x /usr/local/bin/litecoind_start.sh

ADD scripts/setup /usr/local/bin
RUN chmod +x /usr/local/bin/setup

VOLUME ["/litecoin"]

EXPOSE 9332 9333 19332 19335

WORKDIR ${HOME}

ENTRYPOINT ["litecoind_start.sh"]
