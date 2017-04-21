function extip --description 'Output external IP'
	dig +short myip.opendns.com @resolver1.opendns.com
end
