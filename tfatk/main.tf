resource "digitalocean_droplet" "scanner" {
  ssh_keys           = var.mykey
  image              = "ubuntu-18-04-x64"
  region             = "nyc3"
  size               = "s-2vcpu-2gb"
  private_networking = true
  backups            = false
  ipv6               = true
  name               = var.scanner_img_name
  tags               = ["atk"]
  count              = var.scanner_count
}

resource "digitalocean_droplet" "recon" {
  ssh_keys           = var.mykey
  image              = "ubuntu-18-04-x64"
  region             = "nyc3"
  size               = "s-2vcpu-4gb"
  private_networking = true
  backups            = false
  ipv6               = true
  name               = var.recon_img_name
  tags               = ["recon"]
  count              = var.recon_count
}

resource "digitalocean_droplet" "hq" {
  ssh_keys           = var.mykey
  image              = "ubuntu-18-04-x64"
  region             = "nyc3"
  size               = "s-1vcpu-1gb"
  private_networking = true
  backups            = false
  ipv6               = true
  name               = var.hq_img_name
  tags               = ["hq"]
  count              = var.hq_count
}

output "Scanner_Name" {
  value = digitalocean_droplet.scanner[*].name
}

output "Scanner_PublicIP" {
  value = digitalocean_droplet.scanner[*].ipv4_address
}

output "Recon_Name" {
  value = digitalocean_droplet.recon[*].name
}

output "Recon_PublicIP" {
  value = digitalocean_droplet.recon[*].ipv4_address
}

output "HQ_Name" {
  value = digitalocean_droplet.hq[*].name
}

output "HQ_PublicIP" {
  value = digitalocean_droplet.hq[*].ipv4_address
}
