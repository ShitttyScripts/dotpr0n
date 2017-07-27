function freebsd-up-2
    cd /usr/src
    make installworld
    mergemaster -Ui
    # shutdown -r now
end

