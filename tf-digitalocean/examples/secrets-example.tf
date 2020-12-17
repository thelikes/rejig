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
