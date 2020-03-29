# rejig

A suite of ansible scripts to transform a box for attack purposes

To use, install Ansible, configure your hosts file and run the following
command. Ansible will remotely configure the box for offensive attack purposes. 

` ansible-playbook -i hosts --extra-vars "hosts=remote" playbook-bun2atk.yml`

Where the hosts file looks like:

```
[remote]
box_name ansible_python_interpreter=/usr/bin/python3
```

Box name can be named in `~/.ssh/config`

## Current Tasks

### OS Update
1. System update - update, upgrade, reboot and wait
2. Install core system packages - zsh,tmux,python,python-pip,python3,python3-pip,libcurl4-openssl-dev,libssl-dev,tree,nmap,nfs-common,gnome-screenshot,libffi-dev,python-dev,build-essential,whois,proxychains,ack-grep,hydra,jq,chromium-browser,socat,dos2unix,html2text,unzip
3. Install oh-my-zsh (its better than what you're using)

### Attack
1. Install go - go1.13.7.linux-amd64.tar.gz
2. Install go tools - gobuster,ffuf,amass,gwdomains,fuzznav,subfinder,httprobe,meg,assetfinder,waybackurls,unfurl,fff,gf,anew,gron,html-tool,tok,gowitness,webanalyze,hakrawler,wildcheck,get-title
3. Populate /opt/  - SecLists,wfuzz,sqlmap,Sublist3r,tplmap,CrackMapExec,impacket,commix,parameth,api_wordlist,fuzz.txt,dirsearch,node-dirbuster,fuzzmost,wzrd,dnsgen,ShoScan,fav-up,massdns,LinkFinder,cc.py,Arjun,pathbrute
