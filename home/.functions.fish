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
            pip install --upgrade (pip list --outdated | awk '/.*/ {print $1}')
        case Linux
            echo "=====[ apt-get Software Update ]===================================="; and \
            sudo apt-get update; and \
            sudo apt-get upgrade -y; and \
            sudo apt-get dist-upgrade -y; and \
            sudo apt-get autoremove -y; and \
            sudo apt-get remove -y (deborphan); and \
            echo "=====[ Homebrew ]================================================="; and \
            brew update; and \
            brew upgrade; and \
            brew cleanup -s; and \
            echo "=====[ npm ]======================================================"; and \
            sudo npm install npm -g; and \
            sudo npm update -g; and \
            echo "=====[ Gems ]====================================================="; and \
            sudo gem update; and \
            echo "=====[ pip ]======================================================"; and \
            sudo pip install --upgrade (pip list --outdated | awk '/.*/ {print $1}'); and \
            sudo pip3 install --upgrade (pip3 list --outdated | awk '/.*/ {print $1}')
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

# function mkicns() {
#   if [[ -z "$@" ]]; then
#       echo "Input file missing"
#   else
#     filename=${1%.*}
#     mkdir $filename.iconset
#     sips -z 16 16   $1 --out $filename.iconset/icon_16x16.png
#     sips -z 32 32   $1 --out $filename.iconset/icon_16x16@2x.png
#     sips -z 32 32   $1 --out $filename.iconset/icon_32x32.png
#     sips -z 64 64   $1 --out $filename.iconset/icon_32x32@2x.png
#     sips -z 128 128 $1 --out $filename.iconset/icon_128x128.png
#     sips -z 256 256 $1 --out $filename.iconset/icon_128x128@2x.png
#     sips -z 256 256 $1 --out $filename.iconset/icon_256x256.png
#     sips -z 512 512 $1 --out $filename.iconset/icon_256x256@2x.png
#     sips -z 512 512 $1 --out $filename.iconset/icon_512x512.png
#     cp $1 $filename.iconset/icon_512x512@2x.png
#     iconutil -c icns $filename.iconset
#     rm -r $filename.iconset
#   fi
# }
