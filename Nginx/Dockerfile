FROM kyma/docker-nginx

COPY nginx.default /etc/nginx/sites-enabled/default

# Add src.
COPY src/ /var/www

CMD 'nginx'
