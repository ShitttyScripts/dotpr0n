function haltall
	for v in (vagrant global-status | awk '/running/{print $1}')
		vagrant suspend $v
	end
end

