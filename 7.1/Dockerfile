#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM php:7.1-cli

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get update && apt-get install git libpng-dev nodejs openssh-client rsync zip unzip wget -y
RUN ln -s `which npm` /usr/local/bin/npm
RUN docker-php-ext-install gd

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"
RUN composer -n global require -n "hirak/prestissimo"
RUN composer -n global require -n "drupal/coder"

RUN wget -O /usr/bin/drush https://github.com/drush-ops/drush-launcher/releases/download/0.6.0/drush.phar
RUN chmod +x /usr/bin/drush

RUN wget -O /usr/bin/phpcs https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
RUN chmod +x /usr/bin/phpcs
RUN phpcs --config-set installed_paths /root/.composer/vendor/drupal/coder/coder_sniffer

RUN npm install -g gulp-cli yarn

CMD ["php", "-a"]
