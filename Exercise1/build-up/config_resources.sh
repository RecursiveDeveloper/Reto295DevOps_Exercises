#!/bin/bash

apache_path="/var/www/html"

function config_apache_documents {
    echo -e "\nConfiguring Apache for PHP deployment .....\n"
    local apache_config_file="/etc/apache2/mods-enabled/dir.conf"
    
    chown -R $USER:$USER /var/www/

    if test -f "$apache_path/index.html"; then
        mv $apache_path/index.html $apache_path/index_default.html
    fi

cat << EOF > $apache_config_file
<IfModule mod_dir.c>
    DirectoryIndex index.php index.cgi index.pl index.html index.xhtml index.htm
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF

    systemctl reload apache2
}