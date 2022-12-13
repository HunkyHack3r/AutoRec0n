#!/bin/bash 

##Creating Folders
domain=$1
mkdir /root/$1
mkdir /root/$1/xray
echo -e "\e[1;36mFolders Created..!\e[0m"

subfinder -d $1 -silent | anew /root/$1/subs.txt
assetfinder -subs-only $1 | anew /root/$1/subs.txt
amass enum -passive -d $1 | anew /root/$1/subs.txt
sc=$(cat /root/$1/subs.txt | wc -l)
echo -e "\e[1;36m${sc} Subdomains Gathered..!\e[0m"
                                                                                                                                                                                                                                                                                                                                                                                                               
cat /root/$1/subs.txt | httpx -silent | anew /root/$1/alive.txt              
ac=$(cat /root/$1/alive.txt | wc -l) 
echo -e "\e[1;36mFound ${ac} Alive Domains..!\e[0m"

##Nuclei
cat /root/$1/alive.txt | nuclei -t /home/$USER/cent/cent-nuclei-templates -es info | anew /root/$1/nuclei-results.txt 
echo -e "\e[1;36mNuclei Results Done..!\e[0m"

##XRAY
for i in $(cat /root/$1/alive.txt); do ./xray_linux_amd64 ws --basic-crawler $i --plugins xss,sqldet,xxe,ssrf,cmd-injection,path-traversal --html-output ${i}.html ; done
echo -e "\e[1;36mFinished..!\e[0m"
