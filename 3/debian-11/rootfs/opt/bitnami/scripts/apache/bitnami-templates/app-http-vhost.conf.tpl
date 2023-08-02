{{http_listen_configuration}}
{{before_vhost_configuration}}
<VirtualHost {{http_listen_addresses}}>
  {{server_name_configuration}}
  DocumentRoot {{document_root}}
  RewriteEngine On
  RewriteCond %{HTTPS} !=on
  RewriteCond %{HTTP_HOST} !^(localhost|127.0.0.1)
  RewriteRule ^/(.*) https://%{SERVER_NAME}/$1 [R,L]
  <Directory "{{document_root}}">
    Options -Indexes +FollowSymLinks -MultiViews
    AllowOverride {{allow_override}}
    {{acl_configuration}}
    {{extra_directory_configuration}}
  </Directory>
  {{additional_http_configuration}}
  {{additional_configuration}}
  {{htaccess_include}}
</VirtualHost>
