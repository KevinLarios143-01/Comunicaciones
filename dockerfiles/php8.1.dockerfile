FROM php:8.1.7-fpm

RUN apt-get update && apt-get install -qqy git unzip nano libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libaio1 wget && apt-get clean autoclean && apt-get autoremove --yes &&  rm -rf /var/lib/{apt,dpkg,cache,log}/ 

RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*

#RUN docker-php-ext-install mysqli
RUN apt-get update && apt-get install -y libpq-dev
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
# Install PDO and PGSQL Drivers
RUN docker-php-ext-install pgsql pdo pdo_pgsql 
#composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

