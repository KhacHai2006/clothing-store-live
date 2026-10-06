#!/bin/sh
set -eu

PORT="${PORT:-10000}"

# Make Apache listen on Render's runtime port instead of its Debian default (80).
sed -ri "s/^Listen [0-9]+/Listen ${PORT}/" /etc/apache2/ports.conf
sed -ri "s#<VirtualHost \*:[0-9]+>#<VirtualHost *:${PORT}>#" /etc/apache2/sites-available/000-default.conf

exec apache2-foreground
