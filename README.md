# rejig

An ansible+terraform suite to spawn and provision a virtual machine for attack purposes.

## How To

### Ansible

To use, install Ansible, configure your hosts file and run the following
command. Ansible will remotely configure the box for offensive attack purposes. 

` ansible-playbook -i hosts --extra-vars "hosts=remote" playbook-bun2atk.yml`

Where the hosts file looks like:

```
[remote]
box_name ansible_python_interpreter=/usr/bin/python3
```

Box name can be named in `~/.ssh/config`

### Terraform

1. Edit tfatk/variables.tf
2. Initialize
    ```
    # initialize
    $ terraform init
    ```
3. Dry run
    ```
    # plan changes
    $ terraform plan
    ```
4. Execute
    ```
    # apply
    $ terraform apply
    ```

## Current Tasks

1. Update the OS
2. Install core packages
3. Install golang
4. Install golang tools
5. Populate /opt with various github repositories
6. Install zsh, oh-my-zsh, and my dotfiles

## Specifics

### Core packages

    - zsh
    - tmux
    - python
    - python-pip
    - python3
    - python3-pip
    - libcurl4-openssl-dev
    - libssl-dev
    - tree
    - nmap
    - nfs-common
    - gnome-screenshot
    - libffi-dev
    - python-dev
    - build-essential
    - whois
    - proxychains
    - ack-grep
    - hydra
    - jq
    - chromium-browser
    - socat
    - dos2unix
    - html2text
    - unzip
    - john

### Go tools

    - github.com/OJ/gobuster
    - github.com/ffuf/ffuf
    - github.com/OWASP/Amass/v3/...
    - github.com/thelikes/fuzznav
    - github.com/projectdiscovery/subfinder/cmd/subfinder
    - github.com/tomnomnom/httprobe
    - github.com/tomnomnom/meg
    - github.com/tomnomnom/assetfinder
    - github.com/tomnomnom/waybackurls
    - github.com/tomnomnom/unfurl
    - github.com/tomnomnom/fff
    - github.com/tomnomnom/gf
    - github.com/tomnomnom/anew
    - github.com/tomnomnom/gron
    - github.com/tomnomnom/hacks/html-tool
    - github.com/tomnomnom/hacks/tok
    - github.com/rverton/webanalyze/...
    - github.com/hakluke/hakrawler
    - github.com/theblackturtle/wildcheck
    - github.com/tomnomnom/hacks/get-title
    - github.com/jaeles-project/gospider
    - github.com/lc/gau
    - github.com/glebarez/cero
    - github.com/projectdiscovery/nuclei
    - github.com/projectdiscovery/httpx/cmd/httpx

### Github repos

    - github.com/danielmiessler/SecLists
    - github.com/xmendez/wfuzz/
    - github.com/sqlmapproject/sqlmap
    - github.com/aboul3la/Sublist3r
    - github.com/epinna/tplmap
    - github.com/byt3bl33d3r/CrackMapExec
    - github.com/SecureAuthCorp/impacket
    - github.com/commixproject/commix
    - github.com/maK-/parameth
    - github.com/chrislockard/api_wordlist
    - github.com/Bo0oM/fuzz.txt
    - github.com/nikallass/dirsearch
    - github.com/daviddias/node-dirbuster
    - github.com/thelikes/fuzzmost
    - github.com/thelikes/wzrd
    - github.com/projectante/dnsgen
    - github.com/pathetiq/ShoScan
    - github.com/pielco11/fav-up
    - github.com/blechschmidt/massdns
    - github.com/GerbenJavado/LinkFinder
    - github.com/si9int/cc.py
    - github.com/s0md3v/Arjun
    - github.com/milo2012/pathbrute
    - github.com/staaldraad/xxeserv
    - github.com/ptoomey3/evilarc
    - github.com/almandin/fuxploider
    - github.com/Sab0tag3d/SIET
    - github.com/codingo/NoSQLMap
    - github.com/D35m0nd142/LFISuite
    - github.com/ggabarrin/requestify
    - github.com/rebootuser/LinEnum
    - github.com/Arr0way/linux-local-enumeration-script
    - github.com/InteliSecureLabs/Linux_Exploit_Suggester
    - github.com/n00py/Hwacha
    - github.com/projectdiscovery/nuclei-templates
    - github.com/gwen001/github-search
    - github.com/Greenwolf/Spray
    - github.com/FlameOfIgnis/Pwdb-Public
    - github.com/dirkjanm/ldapdomaindump
    - github.com/fuzzdb-project/fuzzdb
    - github.com/tennc/fuzzdb

## To do

### evaluate / implement 

- [ ] bypass-firewalls-by-DNS-history
- [ ] cloudflare_enum
- [ ] spoofcheck
- [ ] msf
- [ ] wpscan
- [ ] [dnstwist](https://github.com/elceef/dnstwist)
- [ ] [wordlistgen](https://github.com/ameenmaali/wordlistgen)
- [ ] [pathbrute](https://github.com/milo2012/pathbrute)
- [ ] [shuffledns](https://github.com/projectdiscovery/shuffledns)
- [ ] [fuzzdb](https://github.com/fuzzdb-project/fuzzdb)
- [ ] [dns validator](https://github.com/vortexau/dnsvalidator)
- [ ] [crithit](https://github.com/codingo/crithit)
- [ ] [minidump](https://github.com/Mr-Un1k0d3r/MiniDump)
- [ ] [atlas - sqlmap tamper discovery](https://github.com/m4ll0k/Atlas)
- [ ] [fprobe](https://github.com/theblackturtle/fprobe)
- [ ] [zgrab](https://github.com/zmap/zgrab2)
