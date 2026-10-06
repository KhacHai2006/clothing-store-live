FROM php:8.2-apache

# Cài đặt extension kết nối MySQL/TiDB
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

# Copy toàn bộ code vào thư mục web của Apache
COPY . /var/www/html/

# Render routes web traffic to PORT (10000 by default).
RUN a2enmod rewrite
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
EXPOSE 10000

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
