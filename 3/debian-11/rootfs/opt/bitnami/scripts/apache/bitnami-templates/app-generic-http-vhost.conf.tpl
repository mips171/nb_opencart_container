{{http_listen_configuration}}
{{before_vhost_configuration}}
<VirtualHost {{http_listen_addresses}}>
  {{server_name_configuration}}
  {{additional_http_configuration}}
  RewriteEngine On
  RewriteCond %{HTTPS} !=on
  RewriteCond %{HTTP_HOST} !^(localhost|127.0.0.1)
  RewriteRule ^/(.*) https://%{SERVER_NAME}/$1 [R,L]
  {{additional_configuration}}
</VirtualHost>
