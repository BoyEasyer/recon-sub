# recon-sub
# Recon Script - Automated Subdomain Enumeration and Reconnaissance

This bash script automates the process of subdomain enumeration, scanning, and web reconnaissance. It utilizes several open-source tools to gather information about a given domain and save results in an organized folder structure. This script is ideal for security researchers, penetration testers, and bug bounty hunters.

## Features

- Automated subdomain enumeration using multiple tools (Amass, Sublist3r, Subfinder, Assetfinder, crt.sh)
- Alive subdomain detection
- Screenshots of alive subdomains using GoWitness
- JavaScript file extraction and analysis
- URL discovery from JS files using GoLinkFinder
- URL enumeration from known archives (Wayback Machine, getallurls)
- Directory and virtual host discovery (Gobuster, FFUF)
- DNS resolution using MassDNS
- Organizes output into specific directories for subdomains, scans, screenshots, JS files, and URLs

## Prerequisites

The following tools are required to run the script:

- `amass`
- `sublist3r`
- `subfinder`
- `assetfinder`
- `crt.sh` (API access via `curl` and `jq`)
- `httprobe`
- `gowitness`
- `getJS`
- `GoLinkFinder`
- `getallurls`
- `waybackurls`
- `waybackrobots`
- `massdns`
- `gobuster`
- `ffuf`

### Installing Dependencies

To install these dependencies, run the following command in the terminal:

```bash
# Install tools
sudo apt update
sudo apt install amass sublist3r jq gobuster curl massdns

# Install Subfinder
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

# Install Assetfinder
go get -u github.com/tomnomnom/assetfinder

# Install httprobe
go get -u github.com/tomnomnom/httprobe

# Install Gowitness
go install github.com/sensepost/gowitness@latest

# Install getJS
go get -u github.com/003random/getJS

# Install GoLinkFinder
go get -u github.com/1ndianl33t/GoLinkFinder

# Install getallurls
go get -u github.com/lc/gau

# Install Waybackurls
go get -u github.com/tomnomnom/waybackurls

# Install Waybackrobots
go get -u github.com/edoardottt/waybackrobots

# Install FFUF
go get -u github.com/ffuf/ffuf

