```markdown
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
```

## Usage

1. Make the script executable:

```bash
chmod +x recon.sh
```

2. Run the script by passing a domain name as an argument:

```bash
./recon.sh example.com
```

This will create a directory structure under the provided domain name:

```
example.com/
│
├── subdomains/   # Subdomain enumeration results
├── scans/        # Results from directory and vhost discovery
├── screenshots/  # Screenshots of alive subdomains
├── js/           # Extracted JS files from subdomains
├── urls/         # Discovered URLs
```

## Output

- **Subdomains:** Found subdomains from multiple sources.
- **Screenshots:** Captured screenshots of alive subdomains.
- **JavaScript Files:** JS files extracted from subdomains.
- **URLs:** URLs and endpoints extracted from JS files and other sources.
- **Directory Discovery:** Discovered directories and virtual hosts.

## Notes

- Make sure you have all dependencies installed before running the script.
- For better results, ensure the `resolvers.txt` file is updated with valid DNS resolvers in your system for MassDNS.

## Disclaimer

This script is intended for legal use only. Ensure you have proper authorization to scan the domain(s) before using this tool.

```

This README provides a brief overview of the script, its dependencies, how to install them, usage instructions, and legal notes, all in a format common to GitHub projects.
