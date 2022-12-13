#!/bin/bash 

##Installing Go
if ! command -v go &> /dev/null
then
    echo "Go could not be found!"
    wget -c https://go.dev/dl/go1.19.4.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go && apt install golang-go
    export PATH=$PATH:/usr/local/go/bin
    source ~/.bash_profile
    source ~/.profile
    if ! command -v go &> /dev/null
    then
        echo "Go installation failed!"
    else
        echo "Go installed successfully !"
    fi
else
    echo "Requirement Already Satisfied: Go"
fi


##Installing Amass
if ! command -v amass &> /dev/null
then
    echo "Amass could not be found!"
    go install -v github.com/OWASP/Amass/v3/...@master
    if ! command -v amass &> /dev/null
    then
        echo "Amass installation failed!"
    else
        echo "Amass installed successfully !"
    fi
else
    echo "Requirement Already Satisfied: Amass"
fi


##Installing AssetFinder
if ! command -v assetfinder &> /dev/null
then
    echo "AssetFinder could not be found!"
    go install -v github.com/tomnomnom/assetfinder@latest
    if ! command -v amass &> /dev/null
    then
        echo "AssetFinder installation failed!"
    else
        echo "AssetFinder installed successfully !"
    fi
else
    echo "Requirement Already Satisfied: AssetFinder"
fi


##Installing SubFinder
if ! command -v subfinder &> /dev/null
then
    echo "SubFinder could not be found!"
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    if ! command -v subfinder &> /dev/null
    then
        echo "SubFinder installation failed!"
    else
        echo "SubFinder installed successfully !"
    fi
else
    echo "Requirement Already Satisfied: SubFinder"
fi


##Installing Anew
if ! command -v anew &> /dev/null
then
    echo "Anew could not be found!"
    go install -v github.com/tomnomnom/anew@latest
    if ! command -v anew &> /dev/null
    then
        echo "Anew installation failed!"
    else
        echo "Anew installed successfully !"
    fi
else
    echo "Requirement Already Satisfied: Anew"
fi


##Installing Httpx     
if ! command -v httpx &> /dev/null
then
    echo "Httpx could not be found!"
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    if ! command -v httpx &> /dev/null
    then
        echo "Httpx installation failed!"
    else
        echo "Httpx installed successfully !"
    fi
else
    echo "Requirement Already Satisfied: Httpx"
fi


##Installing Nuclei
if ! command -v nuclei &> /dev/null
then
    echo "Nuclei could not be found!"
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    if ! command -v nuclei &> /dev/null
    then
        echo "Nuclei installation failed!"
    else
        echo "Nuclei installed successfully !"
    fi
else
    echo "Requirement Already Satisfied: Nuclei"
fi


##Installing Cent
if ! command -v cent &> /dev/null
then
    echo "Cent could not be found!"
    GO111MODULE=on go install -v github.com/xm1k3/cent@latest
    cent init
    cent -p cent-nuclei-templates -k
    if ! command -v cent &> /dev/null
    then
        echo "Cent installation failed!"
    else
        echo "Cent installed successfully !"
    fi
else
    echo "Requirement Already Satisfied: Cent"
fi


##Installing Xray
if [ ! -f xray_linux_amd64 ]
then
    echo "Xray could not be found!"
    wget -c https://github.com/chaitin/xray/releases/download/1.9.3/xray_linux_amd64.zip
    unzip -q xray_linux_amd64.zip
    if [ ! -f xray_linux_amd64 ]
    then
        echo "Xray could not be found"
    else
        echo "Xray is now ready !"
    fi
else
    echo "Requirement Already Satisfied: Xray"
    echo "Script Ends...."
fi

chmod +x autorecon.sh
sh autorecon.sh                                                                                                                                                                                                                                                                                                                                      
