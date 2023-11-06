#!/bin/bash

repo_name="bootcamp-devops-2023"
apache_path="/var/www/html"

function check_repo {
    local repo_url="https://github.com/roxsross/bootcamp-devops-2023.git"
    local branch="clase2-linux-bash"

    find $repo_name &> /dev/null
    if [[ $? == 1 ]]; then
        git clone $repo_url
    fi
    
    find $repo_name &> /dev/null
    if [[ $? == 0 ]]; then
        cd $repo_name
        git checkout $branch
        git pull origin $branch
    fi
}

function copy_php_files {
    cp -Rf app-295devops-travel/* $apache_path
}

function config_apache_documents {
    local apache_config_file="/etc/apache2/mods-enabled/dir.conf"

    chown -R $USER:$USER /var/www/html/
    mv $apache_path/index.html $apache_path/index_default.html

cat << EOF > $apache_config_file
<IfModule mod_dir.c>
    DirectoryIndex index.php index.cgi index.pl index.html index.xhtml index.htm
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF

    systemctl reload apache2
}

check_repo

copy_php_files

config_apache_documents
