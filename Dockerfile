FROM php:8.2-apache

# Cài đặt extension kết nối MySQL/TiDB
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy toàn bộ code vào thư mục web của Apache
COPY . /var/www/html/

# Bật rewrite mod và mở cổng 80
RUN a2enmod rewrite
EXPOSE 80