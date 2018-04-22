#!/usr/bin/env bash
set -e
set -u
set -o pipefail
 

case "$1" in
    "deploy_challenge")
        domain="${2}"
	token=$(cat /opt/dehydrated/duckdns-token.txt) 
        curl "https://www.duckdns.org/update?domains=$domain&token=$token&txt=$4"
        echo
        ;;
    "clean_challenge")
        domain="${2}"
        token=$(cat /opt/dehydrated/duckdns-token.txt)
        curl "https://www.duckdns.org/update?domains=$domain&token=$token&clear=true"
	# this is need to set the domain again to the IP of the server
	curl -k "https://www.duckdns.org/update?domains=$domain&token=$token&ip="
        echo
        ;;
    "deploy_cert")
	cat \
           /opt/dehydrated/certs/${2}/fullchain.pem \
	   /opt/dehydrated/certs/${2}/privkey.pem \
	   > /opt/dehydrated/certs/${2}.pem

        systemctl restart haproxy
        ;;
    "unchanged_cert")
        ;;
    "startup_hook")
        ;;
    "exit_hook")
        ;;
    *)
        echo Unknown hook "${1}"
        exit 0
        ;;
esac


