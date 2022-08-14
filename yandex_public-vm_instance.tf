resource "yandex_compute_instance" "public-vm" {
  name        = "public-vm"
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
    subnet_id = "e9bk1fp5d7mprcugkcoj"
  }

  metadata = {
       ssh-keys = "romrsch:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "netologyvpc" {
	name = "public"
}

resource "yandex_vpc_subnet" "public" {
  zone       = "ru-central1-a"
  network_id = "e9bk1fp5d7mprcugkcoj"
}

