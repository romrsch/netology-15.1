resource "yandex_compute_instance" "private-vm" {
  name        = "private-vm"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8m5ohveheh58p7ajhl"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
  }

  metadata = {
    ssh-keys = "romrsch:${file("~/.ssh/id_rsa.pub")}"
  }
}


