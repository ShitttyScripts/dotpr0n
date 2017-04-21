function flushdns
	dscacheutil -flushcache; and killall -HUP mDNSResponder
end

