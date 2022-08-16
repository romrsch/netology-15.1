resource "yandex_vpc_network" "foo" {
  name = "netology-vpc"
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.foo.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}


resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.foo.id
  v4_cidr_blocks = ["192.168.20.0/24"]
}


resource "yandex_vpc_route_table" "lab-rt-a" {
  network_id = yandex_vpc_network.foo.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}