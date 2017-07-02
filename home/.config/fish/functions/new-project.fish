function new-project
    if test (count $argv) -gt 0
        # git clone https://github.com/herrbischoff/project-template $1 && \
        # cd $1 && \
        # rm -rf .git/ && \
        # git init && \
        # cd 04_Development && \
        # npm install && \
        # cd .. && \
        # echo "*---===[ All done! You may start coding now. ] ===---*"
    else
        echo "usage: new-project <project-name>"
    end
end
