
# AutoRec0n - A Simple tool to Automate the Recon Process

AutoRec0n is a simple tool to help automate basic reconnaissance and scanning tasks. It can be used to gather information about your target, including IP Addresses, Subdomains, Alive Subdomains and perform basic scans against the alive subdomains with the help of the tools 'Nuclei' and 'XRay' which will check for major vulnerabilities such as "Command Injection", "SQL Injection", "Cross-Site Scripting", and "Host Header Injection" etc.


## Installation

First-time Installation: (Installing the dependencies)
```bash
  git clone https://github.com/HunkyHack3r/AutoRec0n.git
  cd AutoRec0n/
  chmod +x setup.sh
  ./setup.sh
```
After the Installation, you can directly execute:

```bash
   ./autorecon.sh <target>
```
## Usage/Examples

As for now, the tool supports only single domain scan.
```bash
./autorecon.sh testyou.in
```

## Features

- Subdomain Enumeration.
- Alive Subdomains Enumeration.
- Nuclei scan with private templates. (Cent Integration)
- Web Basic scans with XRay tool.



## Tools included
- [Go language](https://golangdocs.com/install-go-linux)
- [Amass](https://github.com/OWASP/Amass)
- [AssetFinder](https://github.com/tomnomnom/assetfinder)
- [SubFinder](https://github.com/projectdiscovery/subfinder)
- [Anew](https://github.com/tomnomnom/anew)
- [Httpx](https://github.com/projectdiscovery/httpx)
- [Nuclei](https://github.com/projectdiscovery/nuclei)
- [Cent](https://github.com/xm1k3/cent)
- [Xray](https://github.com/chaitin/xray)
## Authors

- [@HunkyHack3r](https://github.com/HunkyHack3r)
- [@0xElkot](https://github.com/0xElkot) - Thanks for the Automation script :)


## Optimizations

- Multi Domain Scan Support
- Additional Web Scanners Integration
- PoC Support
- Vulnerability Dashboard