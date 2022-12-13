#!/bin/bash 

##Installing Go
if ! command -v go &> /dev/null
then
    echo -e "\e[31mGo could not be found!\e[0m"
    ##wget -c https://go.dev/dl/go1.19.4.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go && apt install golang-go
    export PATH=$PATH:/usr/local/go/bin
    source ~/.bash_profile
    source ~/.profile
    if ! command -v go &> /dev/null
    then
        echo -e "\e[31mGo installation failed!\e[0m"
    else
        echo -e "\e[32mGo installed successfully !\e[0m"
    fi
else
    echo -e "\e[32mRequirement Already Satisfied: Go\e[0m"
fi


##Installing Amass
if ! command -v amass &> /dev/null
then
    echo -e "\e[31mAmass could not be found!\e[0m"
    go install -v github.com/OWASP/Amass/v3/...@master
    if ! command -v amass &> /dev/null
    then
        echo -e "\e[31mAmass installation failed!\e[0m"
    else
        echo -e "\e[32mAmass installed successfully !\e[0m"
    fi
else
    echo -e "\e[32mRequirement Already Satisfied: Amass\e[0m"
fi


##Installing AssetFinder
if ! command -v assetfinder &> /dev/null
then
    echo -e "\e[31mAssetFinder could not be found!\e[0m"
    go install -v github.com/tomnomnom/assetfinder@latest
    if ! command -v amass &> /dev/null
    then
        echo -e "\e[31mAssetFinder installation failed!\e[0m"
    else
        echo -e "\e[32mAssetFinder installed successfully !\e[0m"
    fi
else
    echo -e "\e[32mRequirement Already Satisfied: AssetFinder\e[0m"
fi


##Installing SubFinder
if ! command -v subfinder &> /dev/null
then
    echo -e "\e[31mSubFinder could not be found!\e[0m"
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    if ! command -v subfinder &> /dev/null
    then
        echo -e "\e[31mSubFinder installation failed!\e[0m"
    else
        echo -e "\e[32mSubFinder installed successfully !\e[0m"
    fi
else
    echo -e "\e[32mRequirement Already Satisfied: SubFinder\e[0m"
fi


##Installing Anew
if ! command -v anew &> /dev/null
then
    echo -e "\e[31mAnew could not be found!\e[0m"
    go install -v github.com/tomnomnom/anew@latest
    if ! command -v anew &> /dev/null
    then
        echo -e "\e[31mAnew installation failed!\e[0m"
    else
        echo -e "\e[32mAnew installed successfully !\e[0m"
    fi
else
    echo -e "\e[32mRequirement Already Satisfied: Anew\e[0m"
fi


##Installing Httpx     
if ! command -v httpx &> /dev/null
then
    echo -e "\e[31mHttpx could not be found!\e[0m"
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    if ! command -v httpx &> /dev/null
    then
        echo -e "\e[31mHttpx installation failed!\e[0m"
    else
        echo -e "\e[32mHttpx installed successfully !\e[0m"
    fi
else
    echo -e "\e[32mRequirement Already Satisfied: Httpx\e[0m"
fi


##Installing Nuclei
if ! command -v nuclei &> /dev/null
then
    echo -e "\e[31mNuclei could not be found!\e[0m"
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    if ! command -v nuclei &> /dev/null
    then
        echo -e "\e[31mNuclei installation failed!\e[0m"
    else
        echo -e "\e[32mNuclei installed successfully !\e[0m"
    fi
else
    echo -e "\e[32mRequirement Already Satisfied: Nuclei\e[0m"
fi


##Installing Cent
if ! command -v cent &> /dev/null
then
    echo -e "\e[31mCent could not be found!\e[0m"
    wget -c https://github.com/xm1k3/cent/releases/download/v1.0/cent
    chmod +x cent
    mv cent /usr/local/bin/cent
    cent init
    cent -p cent-nuclei-templates -k
    if ! command -v cent &> /dev/null
    then
        echo -e "\e[31mCent installation failed!\e[0m"
    else
        echo -e "\e[32mCent installed successfully !\e[0m"
    fi
else
    echo -e "\e[32mRequirement Already Satisfied: Cent\e[0m"
fi


##Installing Xray
if [ ! –f xray_linux_amd64.zip ]
then
    echo -e "\e[31mXray could not be found!\e[0m"
    wget -c https://github.com/chaitin/xray/releases/download/1.9.3/xray_linux_amd64.zip
    unzip -q xray_linux_amd64.zip
    if [ ! -f xray_linux_amd64 ]
    then
        echo -e "\e[31mXray could not be found\e[0m"
    else
        echo -e "\e[32mXray is now ready !\e[0m"
    fi
else
    echo -e "\e[32mRequirement Already Satisfied: Xray\e[0m"
    echo "Script Ends...."
fi

clear
chmod +x autorecon.sh
echo -e "\e[32mAll the requirements are satisfied !\e[0m"
echo -e "\e[36mrun ./autorecon.sh <target>\e[0m"
