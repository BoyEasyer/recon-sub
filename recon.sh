#!/bin/bash

# ============================================
# Installation of Required Tools
# ============================================

# Function to check if a command exists
command_exists () {
    command -v "$1" >/dev/null 2>&1
}

# Update package list
echo -e "\033[1;34m[+] Updating package list... \033[0m"
sudo apt update

# Install essential packages
ESSENTIALS=(git curl wget unzip build-essential)
for pkg in "${ESSENTIALS[@]}"; do
    if ! dpkg -l | grep -qw "$pkg"; then
        echo -e "\033[1;34m[+] Installing $pkg... \033[0m"
        sudo apt install -y "$pkg"
    else
        echo -e "\033[1;32m[✔] $pkg is already installed. \033[0m"
    fi
done

# Install Go (if not installed)
if ! command_exists go; then
    echo -e "\033[1;34m[+] Installing Go... \033[0m"
    wget https://golang.org/dl/go1.20.5.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
    source ~/.bashrc
    rm go1.20.5.linux-amd64.tar.gz
else
    echo -e "\033[1;32m[✔] Go is already installed. \033[0m"
fi

# Install Python and pip (if not installed)
if ! command_exists python3; then
    echo -e "\033[1;34m[+] Installing Python3... \033[0m"
    sudo apt install -y python3
else
    echo -e "\033[1;32m[✔] Python3 is already installed. \033[0m"
fi

if ! command_exists pip3; then
    echo -e "\033[1;34m[+] Installing pip3... \033[0m"
    sudo apt install -y python3-pip
else
    echo -e "\033[1;32m[✔] pip3 is already installed. \033[0m"
fi

# Install jq
if ! command_exists jq; then
    echo -e "\033[1;34m[+] Installing jq... \033[0m"
    sudo apt install -y jq
else
    echo -e "\033[1;32m[✔] jq is already installed. \033[0m"
fi

# Install Amass
if ! command_exists amass; then
    echo -e "\033[1;34m[+] Installing Amass... \033[0m"
    GO111MODULE=on go get -v github.com/OWASP/Amass/v3/...
    export PATH="$PATH:$(go env GOPATH)/bin"
else
    echo -e "\033[1;32m[✔] Amass is already installed. \033[0m"
fi

# Install Sublist3r
if ! command_exists sublist3r; then
    echo -e "\033[1;34m[+] Installing Sublist3r... \033[0m"
    git clone https://github.com/aboul3la/Sublist3r.git /opt/Sublist3r
    sudo pip3 install -r /opt/Sublist3r/requirements.txt
    sudo ln -s /opt/Sublist3r/sublist3r.py /usr/local/bin/sublist3r
else
    echo -e "\033[1;32m[✔] Sublist3r is already installed. \033[0m"
fi

# Install Subfinder
if ! command_exists subfinder; then
    echo -e "\033[1;34m[+] Installing Subfinder... \033[0m"
    GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
    export PATH="$PATH:$(go env GOPATH)/bin"
else
    echo -e "\033[1;32m[✔] Subfinder is already installed. \033[0m"
fi

# Install Assetfinder
if ! command_exists assetfinder; then
    echo -e "\033[1;34m[+] Installing Assetfinder... \033[0m"
    GO111MODULE=on go get -v github.com/tomnomnom/assetfinder
    export PATH="$PATH:$(go env GOPATH)/bin"
else
    echo -e "\033[1;32m[✔] Assetfinder is already installed. \033[0m"
fi

# Install httprobe
if ! command_exists httprobe; then
    echo -e "\033[1;34m[+] Installing httprobe... \033[0m"
    GO111MODULE=on go get -v github.com/tomnomnom/httprobe
    export PATH="$PATH:$(go env GOPATH)/bin"
else
    echo -e "\033[1;32m[✔] httprobe is already installed. \033[0m"
fi

# Install gowitness
if ! command_exists gowitness; then
    echo -e "\033[1;34m[+] Installing gowitness... \033[0m"
    GO111MODULE=on go get -v github.com/sensepost/gowitness
    export PATH="$PATH:$(go env GOPATH)/bin"
else
    echo -e "\033[1;32m[✔] gowitness is already installed. \033[0m"
fi

# Install getJS
if ! command_exists getJS; then
    echo -e "\033[1;34m[+] Installing getJS... \033[0m"
    git clone https://github.com/003random/getJS.git /opt/getJS
    sudo pip3 install -r /opt/getJS/requirements.txt
    sudo ln -s /opt/getJS/getJS.py /usr/local/bin/getJS
else
    echo -e "\033[1;32m[✔] getJS is already installed. \033[0m"
fi

# Install GoLinkFinder
if ! command_exists GoLinkFinder; then
    echo -e "\033[1;34m[+] Installing GoLinkFinder... \033[0m"
    git clone https://github.com/m4ll0k/GoLinkFinder.git /opt/GoLinkFinder
    cd /opt/GoLinkFinder || exit
    sudo pip3 install -r requirements.txt
    sudo ln -s /opt/GoLinkFinder/GoLinkFinder.py /usr/local/bin/GoLinkFinder
    cd - || exit
else
    echo -e "\033[1;32m[✔] GoLinkFinder is already installed. \033[0m"
fi

# Install getallurls
if ! command_exists getallurls; then
    echo -e "\033[1;34m[+] Installing getallurls... \033[0m"
    go get -u github.com/tomnomnom/getallurls
    export PATH="$PATH:$(go env GOPATH)/bin"
else
    echo -e "\033[1;32m[✔] getallurls is already installed. \033[0m"
fi

# Install waybackurls
if ! command_exists waybackurls; then
    echo -e "\033[1;34m[+] Installing waybackurls... \033[0m"
    go get -u github.com/tomnomnom/waybackurls
    export PATH="$PATH:$(go env GOPATH)/bin"
else
    echo -e "\033[1;32m[✔] waybackurls is already installed. \033[0m"
fi

# Install waybackrobots
if ! command_exists waybackrobots; then
    echo -e "\033[1;34m[+] Installing waybackrobots... \033[0m"
    git clone https://github.com/tomnomnom/waybackrobots.git /opt/waybackrobots
    sudo cp /opt/waybackrobots/waybackrobots /usr/local/bin/
    sudo chmod +x /usr/local/bin/waybackrobots
else
    echo -e "\033[1;32m[✔] waybackrobots is already installed. \033[0m"
fi

# Install massdns
if ! command_exists massdns; then
    echo -e "\033[1;34m[+] Installing massdns... \033[0m"
    git clone https://github.com/blechschmidt/massdns.git /opt/massdns
    cd /opt/massdns || exit
    make
    sudo cp bin/massdns /usr/local/bin/
    cd - || exit
else
    echo -e "\033[1;32m[✔] massdns is already installed. \033[0m"
fi

# Install gobuster
if ! command_exists gobuster; then
    echo -e "\033[1;34m[+] Installing gobuster... \033[0m"
    GO111MODULE=on go get -v github.com/OJ/gobuster/v3
    export PATH="$PATH:$(go env GOPATH)/bin"
else
    echo -e "\033[1;32m[✔] gobuster is already installed. \033[0m"
fi

# Install ffuf
if ! command_exists ffuf; then
    echo -e "\033[1;34m[+] Installing ffuf... \033[0m"
    GO111MODULE=on go get -v github.com/ffuf/ffuf
    export PATH="$PATH:$(go env GOPATH)/bin"
else
    echo -e "\033[1;32m[✔] ffuf is already installed. \033[0m"
fi

# Install httprobe if not installed
if ! command_exists httprobe; then
    echo -e "\033[1;34m[+] Installing httprobe... \033[0m"
    GO111MODULE=on go get -v github.com/tomnomnom/httprobe
    export PATH="$PATH:$(go env GOPATH)/bin"
else
    echo -e "\033[1;32m[✔] httprobe is already installed. \033[0m"
fi

# ============================================
# End of Installation Section
# ============================================

domain=$1 # domain name will be inserted here
RED="\033[1;31m" # just the code for red color
RESET="\033[0m" # just the default value to reset color

subdomain_path=$domain/subdomains # specifies the path for subdomains
screenshot_path=$domain/screenshots # specifies the path for screenshots
scan_path=$domain/scans # specifies the path for scans
js_path=$domain/js # specifies the path for js files
url_path=$domain/urls # specifies the path for urls

# Create necessary directories
for path in "$domain" "$subdomain_path" "$screenshot_path" "$scan_path" "$js_path" "$url_path"; do
    if [ ! -d "$path" ]; then
        mkdir -p "$path"
        echo -e "\033[1;32m[✔] Created directory: $path \033[0m"
    else
        echo -e "\033[1;32m[✔] Directory already exists: $path \033[0m"
    fi
done

echo -e "${RED} [+] Launching amass... ${RESET}"
amass enum -brute -active -d "$domain" | grep "$domain" >> "$subdomain_path/found.txt"

echo -e "${RED} [+] Launching Sublist3r... ${RESET}"
sublist3r -d "$domain" -o "$subdomain_path/sublister.txt"
grep "$domain" "$subdomain_path/sublister.txt" >> "$subdomain_path/found.txt"

echo -e "${RED} [+] Launching Subfinder... ${RESET}"
subfinder -d "$domain" -o "$subdomain_path/subfinder.txt"
grep "$domain" "$subdomain_path/subfinder.txt" >> "$subdomain_path/found.txt"

echo -e "${RED} [+] Launching Assetfinder... ${RESET}"
assetfinder --subs-only "$domain" | grep "$domain" >> "$subdomain_path/assetfinder.txt"
grep "$domain" "$subdomain_path/assetfinder.txt" >> "$subdomain_path/found.txt"

echo -e "${RED} [+] Launching crt.sh... ${RESET}"
curl -s "https://crt.sh/?q=%25.$domain&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | grep "$domain" >> "$subdomain_path/crtsh.txt"
grep "$domain" "$subdomain_path/crtsh.txt" >> "$subdomain_path/found.txt"

echo -e "${RED} [+] Finding alive subdomains... ${RESET}"
grep "$domain" "$subdomain_path/found.txt" | sort -u | httprobe -prefer-https | sed 's/https\?:\/\///' | tee -a "$subdomain_path/alive.txt"

echo -e "${RED} [+] Taking screenshots of alive subdomains... ${RESET}"
gowitness file -f "$subdomain_path/alive.txt" -P "$screenshot_path" --no-http

echo -e "${RED} [+] Extracting JS files... ${RESET}"
xargs -I@ bash -c 'getJS -url @ -output '"$js_path"'/@.js' < "$subdomain_path/alive.txt"

echo -e "${RED} [+] Extracting URLs and Endpoints from JS files... ${RESET}"
find "$js_path" -name '*.js' -exec bash -c 'GoLinkFinder -i "$1" -o '"$url_path"'/$(basename "$1").endpoints.txt' _ {} \;

echo -e "${RED} [+] Fetching known URLs... ${RESET}"
getallurls < "$subdomain_path/alive.txt" | tee -a "$url_path/known_urls.txt"

echo -e "${RED} [+] Extracting Archive URLs... ${RESET}"
waybackurls < "$subdomain_path/alive.txt" | tee -a "$url_path/waybackurls.txt"

echo -e "${RED} [+] Extracting robots.txt Information... ${RESET}"
waybackrobots < "$subdomain_path/alive.txt" | tee -a "$url_path/robots.txt"

echo -e "${RED} [+] Launching MassDNS... ${RESET}"
massdns -r lists/resolvers.txt -t A -o S -w "$subdomain_path/massdns.txt" "$subdomain_path/alive.txt"

echo -e "${RED} [+] Starting Directory and Virtual Host Discovery... ${RESET}"
gobuster dir -u "http://$domain/" -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -o "$scan_path/gobuster_directories.txt"
ffuf -u "http://$domain" -H "Host: FUZZ.$domain" -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -o "$scan_path/ffuf_vhosts.txt"

echo -e "${RED} [+] Collecting all unique subdomains... ${RESET}"
cat "$subdomain_path/found.txt" \
    "$subdomain_path/alive.txt" \
    "$subdomain_path/sublister.txt" \
    "$subdomain_path/subfinder.txt" \
    "$subdomain_path/assetfinder.txt" \
    "$subdomain_path/crtsh.txt" \
    "$subdomain_path/massdns.txt" | sort -u > "$subdomain_path/all_unique_subdomains.txt"

echo -e "${RED} [+] All unique subdomains saved to $subdomain_path/all_unique_subdomains.txt ${RESET}"

echo -e "${RED} [+] Taking screenshots of all unique subdomains... ${RESET}"
gowitness file -f "$subdomain_path/all_unique_subdomains.txt" -P "$screenshot_path" --no-http
