function asnip
    set -l ASN (whois -h whois.radb.net $argv[1] | grep origin: | awk '{print $2}')
    whois -h whois.radb.net -- "-i origin $ASN" | grep '^route:' | awk '{print $2}' | sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4
    whois -h whois.radb.net -- "-i origin $ASN" | grep '^route6:' | awk '{print $2}' | sort
    set -e ASN
end

