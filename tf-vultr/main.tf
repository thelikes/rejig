resource "vultr_server" "strike" {
    plan_id = "203"
    region_id = "1"
    os_id = "387"
    tag = "atk"
    hostname = var.strike_img_name
    label = var.strike_img_name
    enable_ipv6 = true
    auto_backup = false
    ssh_key_ids = var.vultr_ssh_key_id
    count = var.strike_count

    provisioner "remote-exec" {
  
        inline = ["apt update && apt install python -y"]

        connection {
            type = "ssh"
            user = "root"
            private_key = "${file(var.vultr_key_path)}"
            host = self.main_ip
        }
    }

    provisioner "local-exec" {
        command = "ansible-playbook -u root -i '${self.main_ip}', --private-key ${var.vultr_key_path} ../ansible/playbook-bun2atk.yml --vault-password-file ${var.my_vualt_file}"
    }
}

output "Strike_PublicIP" {
    value = vultr_server.strike[*].main_ip
}

resource "vultr_server" "scanner" {
    plan_id = "201"
    region_id = "1"
    os_id = "387"
    tag = "scanner"
    hostname = var.scanner_img_name
    label = var.scanner_img_name
    enable_ipv6 = true
    auto_backup = false
    ssh_key_ids = var.vultr_ssh_key_id
    count = var.scanner_count

    provisioner "remote-exec" {
  
        inline = ["apt update && apt install python -y"]

        connection {
            type = "ssh"
            user = "root"
            private_key = "${file(var.vultr_key_path)}"
            host = self.main_ip
        }
    }

    provisioner "local-exec" {
        command = "ansible-playbook -u root -i '${self.main_ip}', --private-key ${var.vultr_key_path} ../ansible/playbook-network-scanner.yml --vault-password-file ${var.my_vualt_file}"
    }
}

output "Scanner_PublicIP" {
    value = vultr_server.scanner[*].main_ip
}

resource "vultr_server" "vpn" {
    plan_id = "201"
    region_id = "1"
    os_id = "387"
    tag = "vpn"
    hostname = var.vpn_img_name
    label = var.vpn_img_name
    enable_ipv6 = true
    auto_backup = false
    ssh_key_ids = var.vultr_ssh_key_id
    count = var.vpn_count

    provisioner "remote-exec" {
  
        inline = ["apt update && apt install python -y"]

        connection {
            type = "ssh"
            user = "root"
            private_key = "${file(var.vultr_key_path)}"
            host = self.main_ip
        }
    }

    provisioner "local-exec" {
        command = "ansible-playbook -u root -i '${self.main_ip}', --private-key ${var.vultr_key_path} ../ansible/playbook-vpn.yml --vault-password-file ${var.my_vualt_file}"
    }
}

output "VPN_PublicIP" {
    value = vultr_server.vpn[*].main_ip
}
