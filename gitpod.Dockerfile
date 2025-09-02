FROM gitpod/workspace-full

# Instalar PHP y extensiones necesarias
RUN sudo apt-get update && sudo apt-get install -y \
    php php-cli php-mysql php-gd php-xml php-mbstring php-curl php-zip php-opcache \
    mariadb-server \
    unzip curl git

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    sudo mv composer.phar /usr/local/bin/composer

# Configurar MySQL
RUN sudo service mysql start && \
    sudo mysql -e "CREATE DATABASE drupal; CREATE USER 'drupal'@'localhost' IDENTIFIED BY 'drupal'; GRANT ALL PRIVILEGES ON drupal.* TO 'drupal'@'localhost'; FLUSH PRIVILEGES;"