#!/bin/bash 

Help()
{
   #Display Help
   echo "Syntax: ./autorecon.sh <target>"
   echo "Eg: ./autorecon.sh google.com"
   echo "options:"
   echo "h     Print this Help."
   echo "v     Print software version and exit."
}

Version()
{
   #Display version
   echo "AutoRec0n v1.0"
}

##Get the options
while getopts ":hv:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      v) # Enter a name
         Version
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

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
cat /root/$1/alive.txt | nuclei -t /root/cent-nuclei-templates -es info | anew /root/$1/nuclei-results.txt 
echo -e "\e[1;36mNuclei Results Done..!\e[0m"

##XRAY
for i in $(cat /root/$1/alive.txt); do ./xray_linux_amd64 ws --basic-crawler $i --plugins xss,sqldet,xxe,ssrf,cmd-injection,path-traversal --html-output ${i}.html ; done
echo -e "\e[1;36mFinished..!\e[0m"
