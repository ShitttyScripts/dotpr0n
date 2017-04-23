function archive
	tar cfv - $argv[1] | pixz | ssh root@vandusen.port0.org "cat > /external/Backup/$argv[2]"
end
