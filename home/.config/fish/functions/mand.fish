#
# Opens man pages in Dash.app.
#

function mand
    if test (count $argv) -gt 0
        open "dash://man:$argv[1]" 2>/dev/null
        if test $status -ne 0
            echo "$argv[0]: Dash is not installed" >&2
        end
    else
      echo 'What manual page do you want?' >&2
    end
end
