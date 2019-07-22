function new-post
    cd ~/blog
    hugo new $argv[1]
    nvim ~/blog/content/$argv[1]
end

