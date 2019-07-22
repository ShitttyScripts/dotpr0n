function portbump
    if count $argv > /dev/null
        cd ~/ports &&\
        sudo port uninstall $argv[1] &&\
        portindex &&\
        echo "## Nitpicking ##" &&\
        sudo port lint --nitpick $argv[1] &&\
        echo "## Checksumming ##" &&\
        sudo port -v checksum $argv[1] &&\
        echo "## Installing ##" &&\
        sudo port install -vst $argv[1] &&\
        echo "All done!"
    else
        echo "Usage: $_ <portname>"
    end
end

