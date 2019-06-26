FROM php:7.1

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get update && apt-get install git libpng-dev nodejs openssh-client rsync zip unzip wget -y
RUN ln -s `which npm` /usr/local/bin/npm
RUN docker-php-ext-install gd

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"
RUN composer -n global require -n "hirak/prestissimo"

RUN wget -O /usr/bin/drush https://github.com/drush-ops/drush-launcher/releases/download/0.6.0/drush.phar
RUN chmod +x /usr/bin/drush

RUN npm install -g gulp-cli

CMD ["php", "-a"]
