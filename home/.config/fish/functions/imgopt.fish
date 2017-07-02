#
# Recursively optimize images
#

function imgopt
    # find . -iname '*.jpg' -exec guetzli {} {} \;
    find . -iname '*.jpg' -or -iname '*.jpeg' -exec jpegoptim --preserve --strip-all --all-progressive '{}' \; and \
    find . -iname '*.png' -exec optipng '{}' \;
end
