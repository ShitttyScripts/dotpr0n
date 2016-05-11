# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
function update
    switch (uname)
        case Darwin
            echo "=====[ Apple Software Update ]===================================="; and \
            sudo softwareupdate -i -a; and \
            echo "=====[ Homebrew ]================================================="; and \
            brew update; and \
            brew upgrade; and \
            brew cleanup -s; and \
            brew cask cleanup; and \
            echo "=====[ npm ]======================================================"; and \
            npm install npm -g; and \
            npm update -g; and \
            echo "=====[ Gems ]====================================================="; and \
            sudo gem update --system; and \
            sudo gem update; and \
            echo "=====[ pip ]======================================================"; and \
            python -m pip install --upgrade (python -m pip list --outdated | awk '/.*/ {print $1}'); and \
            python3 -m pip install --upgrade (python3 -m pip list --outdated | awk '/.*/ {print $1}')
            echo "=====[ Fisherman ]================================================"; and \
            fisher up
        case Linux
            echo "=====[ apt Software Update ]===================================="; and \
            sudo apt update; and \
            sudo apt upgrade -y; and \
            sudo apt full-upgrade -y; and \
            sudo apt autoremove -y; and \
            sudo apt remove -y (deborphan); and \
            echo "=====[ Homebrew ]================================================="; and \
            brew update; and \
            brew upgrade; and \
            brew cleanup -s; and \
            echo "=====[ npm ]======================================================"; and \
            sudo npm install npm -g; and \
            sudo npm update -g; and \
            echo "=====[ Gems ]====================================================="; and \
            sudo gem update; and \
            echo "=====[ pip ]======================================================"
            if cat /etc/issue | grep Ubuntu > /dev/null
                echo "pip updates not supported on Ubuntu as some packages are owned by the system."
            else
                sudo python -m pip install --upgrade (python -m pip list --outdated | awk '/.*/ {print $1}'); and \
                sudo python3 -m pip install --upgrade (python3 -m pip list --outdated | awk '/.*/ {print $1}')
            end
        case '*'
            echo "Not supported on (uname)."
    end
end

function haltall
  for VM in (VBoxManage list runningvms | awk '{ print $2; }')
    VBoxManage controlvm $VM poweroff
  end
end

# Create directory and enter it in one go
function mkdcd
  mkdir "$1"; and cd "$1"
end

#function mp3towav()
#    [[ $# -eq 0 ]]; and { echo "mp3wav mp3file"; exit 1; }
#    for i in "$@"
#    do
#        # create .wav file name
#        local out="${i%/*}.wav"
#        [[ -f "$i" ]]; and ( echo -n "Processing ${i}..."; mpg123 -w "${out}" "$i" &>/dev/null ; and echo "done." || echo "failed."; )
#    done

function archive
    tar -cv --exclude bower_components/ --exclude node_modules/ -f - $argv[1] | pixz -9 | gpg -e -r 'marcel@herrbischoff.com' > $argv[1].tar.xz.gpg
end

function vertraulich
  for file in $argv
    composite -dissolve 20% -gravity center ~/Documents/Watermarks/vertraulich.png $file $file.watermarked.jpg
  end
end

function combine-pdf
  for file in $argv
    convert $argv combined.pdf
  end
end

# An easy way to create .icns files
# Inspired by http://stackoverflow.com/a/20703594
function __mkicns
    set filename (echo $argv[1] | sed 's/\.[^.]*$//')
    mkdir $filename.iconset > /dev/null
    sips -z 16 16 $argv[1] --out $filename.iconset/icon_16x16.png > /dev/null
    sips -z 32 32 $argv[1] --out $filename.iconset/icon_16x16@2x.png > /dev/null
    sips -z 32 32 $argv[1] --out $filename.iconset/icon_32x32.png > /dev/null
    sips -z 64 64 $argv[1] --out $filename.iconset/icon_32x32@2x.png > /dev/null
    sips -z 128 128 $argv[1] --out $filename.iconset/icon_128x128.png > /dev/null
    sips -z 256 256 $argv[1] --out $filename.iconset/icon_128x128@2x.png > /dev/null
    sips -z 256 256 $argv[1] --out $filename.iconset/icon_256x256.png > /dev/null
    sips -z 512 512 $argv[1] --out $filename.iconset/icon_256x256@2x.png > /dev/null
    sips -z 512 512 $argv[1] --out $filename.iconset/icon_512x512.png > /dev/null
    cp $argv[1] $filename.iconset/icon_512x512@2x.png > /dev/null
    iconutil -c icns $filename.iconset > /dev/null
    rm -r $filename.iconset > /dev/null
end
function mkicns
    if not spin "__mkicns $argv[1]"
        return 1
    end
end
