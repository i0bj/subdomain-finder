#!/bin/bash
# This will grab subdomains ip addresses from a site
echo "Enter the site to query: "
read url
echo "[+] Grabbing subdomains from $url"
wget $url
grep "href=" index.html |cut -d "/" -f 3 |grep "\." |cut -d '"' -f 1 | sort -u > list.txt
for sub in $(cat list.txt); do host $sub; done |grep "has address" |cut -d " " -f 4 | sort -u > subdomains.txt
echo "[+] The task has been completed."
