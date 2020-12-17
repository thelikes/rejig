provider "vultr" {
  api_key = "INSERT_API_KEY_HERE"
  rate_limit = 700
  retry_limit = 3
}

variable "vultr_ssh_key_id" {
    description = "vultr ssh key id"
    default = [ "INSERT_SSH_KEY_ID_HERE" ]
}

variable "vultr_key_path" {
    description = "Path to ssh private key for login"
    default = "/home/user/.ssh/id_rsa"
}

variable "my_vualt_file" {
    description = "Ansible vault file location"
    default = "/home/user/.ansible-vault"
}
