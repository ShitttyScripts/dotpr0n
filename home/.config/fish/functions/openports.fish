function openports
	switch (uname)
		case Darwin
			lsof -i | grep LISTEN
		case FreeBSD
			sockstat -4 -l
		case Linux
			netstat -nlp
		'*'
			printf "Not yet supported on %s." (uname)
	end
end
