function acme-install
    if not test -d /usr/local/etc/ssl/$argv[1]
        command mkdir -pv /usr/local/etc/ssl/$argv[1]
    end

    ~/acme.sh/acme.sh --install-cert -d $argv[1] \
        --key-file       /usr/local/etc/ssl/$argv[1]/key.pem  \
        --fullchain-file /usr/local/etc/ssl/$argv[1]/cert.pem \
        --reloadcmd     "service nginx restart"
end
