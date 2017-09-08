function acme-issue
    if not test -d /usr/local/etc/ssl/$1
        command mkdir -pv /usr/local/etc/ssl/$1
    end

    $HOME/acme.sh/acme.sh --issue -d $argv -w /usr/local/www/acme.sh

    $HOME/acme.sh/acme.sh --install-cert -d $1 \
        --key-file       /usr/local/etc/ssl/$1/key.pem  \
        --fullchain-file /usr/local/etc/ssl/$1/cert.pem \
        --reloadcmd     "service nginx restart"
end
