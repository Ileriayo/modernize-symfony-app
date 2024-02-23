# Use PHP 8.2 base image
FROM php:8.2-cli

# Install dependencies
RUN apt-get update && apt-get install -y \
    libicu-dev \
    zip \
    unzip \
    && docker-php-ext-install intl pdo pdo_mysql

RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# Set working directory
WORKDIR /app

# Copy application code
COPY . .

# Expose port
EXPOSE 8000

# Start Symfony server
CMD ["symfony", "server:start", "--no-tls"]