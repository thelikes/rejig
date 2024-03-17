# rejig

An ansible+terraform suite to spawn and provision a virtual machine for attack purposes.

## Spawn

To launch a virtual server and install all tools, run the following command.

```
$ terraform apply # -auto-approve (to skip the prompt)
```

To view current state:

```
$ terraform show
```

To destroy current state:

```
$ terraform destroy # -auto-approve (to skip the prompt)
```

## Setup

### Software

1. Terraform
2. Ansible
3. Python3
4. This repo

### Adjustments

- The `variables.tf` file contains the parameters used to setup the deployed
  terraform state. System names and quantities of systems are set here. 
- Create a file `secrets.tf` to store your digitalocean, vultr, or other cloud
  service api key. In terraform speak, this is called the "provider" and can
  be used on numerous cloud services, or even locally with qemu, virtualbox,
  etc. You'll need to include your SSH key ID as well. An ansible vault file
  can be referenced as well, and is used to decrypt secrets.

Digital Ocean example follows. To use vultr, you'll need to install the vultr
[provider](https://github.com/vultr/terraform-provider-vultr) first. 

```
provider "digitalocean" {
    token = ""
}

variable "mykey" {
    description = "digitalocean key id"
    default = [XXXXXXXX]
}

variable "myprivkey" {
    description = "my priv key file path"
    default = "/home/user/.ssh/priv.key"
}

variable "myvualtfile" {
    description = "my ansible vault file"
    default = "/home/user/.ansible-vault"
}
```

- Additionally, in order to keep terraform hanging waiting for ansible's first
  ssh connection, create the file `~/.ansible.cfg` with the following contents.

```
[defaults]
host_key_checking = False
```

## How this Works

Terraform is used to spawn and destroy systems. Terraform can be used for many
"providers", this repo currently supports digitalocean and vultr. Terraform will
spawn systems upon execution of `apply` and will then use the `remote-exec` and
`local-exec` to install python and execute ansible. Ansible is used to install
crap. The list of crap installed can be found in various files under
`ansible/roles`. Currently this includes core `apt` packages, git repositories,
Go (the language) and go tools. To add, remove, or modify what is installed,
edit the `tasks/main.yml` and `vars/main.yml`. (See below for a complete list
of crap).

Terraform and ansible do not have to be used together. Should you want to only
use terraform to spawn/destroy systems, remove the `{remote,local}-exec` calls
from `main.tf`. Should you only want to use ansible, skip executing terraform
and instead just run ansible. Ansible can be run on its own by feeding it
a "playbook", a host, user, and SSH key. There are many ways to do this, one of
the most straight forward being:

```bash
ansible-playbook -u <user> -i 1.2.3.4, \
  --private-key <priv key> \
  -e 'ansible_python_interpreter=/usr/bin/python3' \
  <playbook>.yml
```

## Specifics

### Core packages

- zsh
- tmux
- python
- python-pip
- python3
- python3-pip
- socat
- vim
- rsync
- curl
- git
- unattended-upgrades
- htop

### Hack packages

- libcurl4-openssl-dev
- libssl-dev
- tree
- nmap
- masscan
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
- dos2unix
- html2text
- unzip
- john
- postgresql
- mysql-client
- postgresql-contrib
- hydra
- medusa
- default-jdk
- metasploit

### Go tools

- github.com/OWASP/Amass/v3/...
- github.com/OJ/gobuster
- github.com/ffuf/ffuf
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
- github.com/tomnomnom/hacks/anti-burl
- github.com/tomnomnom/hacks/get-title
- github.com/tomnomnom/comb
- github.com/rverton/webanalyze/...
- github.com/hakluke/hakrawler
- github.com/theblackturtle/wildcheck
- github.com/jaeles-project/gospider
- github.com/lc/gau
- github.com/glebarez/cero
- github.com/projectdiscovery/nuclei/v2/cmd/nuclei
- github.com/projectdiscovery/httpx/cmd/httpx
- github.com/003random/getJS
- github.com/pry0cc/subgen
- github.com/lc/subjs

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
- github.com/vortexau/dnsvalidator
- github.com/x90skysn3k/brutespray
- github.com/1N3/BruteX
- github.com/P0cL4bs/Kadimus
- github.com/offensive-security/exploitdb.git
- github.com/irsdl/IIS-ShortName-Scanner
