

#!/usr/bin/env bash

set -e
set -u
set -o pipefail

DOMAINS=$(cat /opt/dehydrated/domains.txt)

for domain in $DOMAINS
do
  token=$(cat /opt/dehydrated/duckdns-token.txt) 
  curl "https://www.duckdns.org/update?domains=$domain&token=$token&ip="
done

