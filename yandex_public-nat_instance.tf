resource "yandex_compute_instance" "nat" {
  name        = "nat"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.public.id
    nat_ip_address = "192.168.10.254"
    nat            = true
  }

  metadata = {
    ssh-keys = "romrsch:${file("~/.ssh/id_rsa.pub")}"
  }
}


