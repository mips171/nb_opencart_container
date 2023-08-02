# Default Virtual Host configuration.

# Let Apache know we're behind a SSL reverse proxy
SetEnvIf X-Forwarded-Proto https HTTPS=on

<VirtualHost _default_:8080>
  DocumentRoot "{{APACHE_BASE_DIR}}/htdocs"
  RewriteEngine On
  RewriteCond %{HTTPS} !=on
  RewriteCond %{HTTP_HOST} !^(localhost|127.0.0.1)
  RewriteRule ^/(.*) https://%{SERVER_NAME}/$1 [R,L]
  <Directory "{{APACHE_BASE_DIR}}/htdocs">
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
  </Directory>

  # Error Documents
  ErrorDocument 503 /503.html
</VirtualHost>

Include "{{APACHE_CONF_DIR}}/bitnami/bitnami-ssl.conf"
