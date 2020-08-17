resource "digitalocean_droplet" "strike" {
    ssh_keys           = var.mykey
    image              = "ubuntu-18-04-x64"
    region             = "nyc3"
    size               = "s-2vcpu-2gb"
    private_networking = true
    backups            = false
    ipv6               = true
    name               = var.strike_img_name
    tags               = ["atk"]
    count              = var.strike_count

    provisioner "remote-exec" {
  
        inline = ["apt update && apt install python -y"]

        connection {
            type = "ssh"
            user = "root"
            private_key = "${file(var.myprivkey)}"
            host = self.ipv4_address
        }
    }

    provisioner "local-exec" {
        command = "ansible-playbook -u root -i '${self.ipv4_address}', --private-key ${var.myprivkey} ansible/playbook-bun2atk.yml --vault-password-file ${var.myvualtfile}"
    }
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
    tags               = ["atk"]
    count              = var.recon_count

    provisioner "remote-exec" {
  
        inline = ["apt update && apt install python -y"]

        connection {
            type = "ssh"
            user = "root"
            private_key = "${file(var.myprivkey)}"
            host = self.ipv4_address
        }
    }

    provisioner "local-exec" {
        command = "ansible-playbook -u root -i '${self.ipv4_address}', --private-key ${var.myprivkey} ansible/playbook-bun2atk.yml --vault-password-file ${var.myvualtfile}"
    }
}

resource "digitalocean_droplet" "nmap" {
    ssh_keys           = var.mykey
    image              = "ubuntu-18-04-x64"
    region             = "nyc3"
    size               = "s-2vcpu-2gb"
    private_networking = true
    backups            = false
    ipv6               = true
    name               = var.nmap_img_name
    tags               = ["atk"]
    count              = var.nmap_count

    provisioner "remote-exec" {
  
        inline = ["apt update && apt install python -y"]

        connection {
            type = "ssh"
            user = "root"
            private_key = "${file(var.myprivkey)}"
            host = self.ipv4_address
        }
    }

    provisioner "local-exec" {
        command = "ansible-playbook -u root -i '${self.ipv4_address}', --private-key ${var.myprivkey} ansible/playbook-foundation.yml --vault-password-file ${var.myvualtfile}"
    }
}


output "Strike_Name" {
    value = digitalocean_droplet.strike[*].name
}

output "Strike_PublicIP" {
    value = digitalocean_droplet.strike[*].ipv4_address
}

output "Recon_Name" {
    value = digitalocean_droplet.recon[*].name
}

output "Recon_PublicIP" {
    value = digitalocean_droplet.recon[*].ipv4_address
}

output "NMAP_Name" {
    value = digitalocean_droplet.nmap[*].name
}

output "NMAP_PublicIP" {
    value = digitalocean_droplet.nmap[*].ipv4_address
}
