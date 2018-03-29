function archive
	tar cfv - $argv[1] | pixz -9 | gpg --encrypt --recipient marcel@herrbischoff.com | ssh herrbischoff@vandusen.port0.org "cat > /external/Projekte/$argv[2].txz.gpg"
end
