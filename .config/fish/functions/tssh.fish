function tssh
    ssh $argv[1] tmux has-session -t _default; or tmux new-session -s _default -d
end

