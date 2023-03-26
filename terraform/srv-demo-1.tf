resource "proxmox_vm_qemu" "srv_demo_1" {

    count = 5 # just want 1 for now, set to 0 and apply to destroy VM
    name = "k3s-vm-${count.index + 1}"
    desc = "Ubuntu 20 Server from TERRAFORM"
    #vmid = "401"
    target_node = "franhost"

    clone = "ubuntu-20-template"
    cores = 4
    sockets = 1
    cpu = "host"
    memory = 4096

    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    disk {
        storage = "fran-samsung-2tb"
        type = "scsi"
        size = "10G"
    }
}