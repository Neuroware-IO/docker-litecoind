#!/bin/bash

set -x

if [ "$(id -u)" = '0' ]; then
	chown -R litecoin .
	exec gosu litecoin "$0" "$@"
fi

exec setup "$@"
