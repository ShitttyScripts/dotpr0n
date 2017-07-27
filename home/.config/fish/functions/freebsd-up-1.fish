function freebsd-up-1
    svn update /usr/src
    less /usr/src/UPDATING
    cd /usr/src
    make -j4 buildworld
    make -j4 kernel
    # shutdown -r now
end

