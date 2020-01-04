function asn
    set -l ASN $argv[1]
    whois -h whois.radb.net -- "-i origin $ASN" | grep '^route:' | awk '{print $2}' | sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 | cidr-merge
    whois -h whois.radb.net -- "-i origin $ASN" | grep '^route6:' | awk '{print $2}' | sort | cidr-merge
    set -e ASN
end

