terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.77.0"
}

provider "yandex" {
  token     = "AQAEA7qjbMa6AATuwQ3IiuegYU0JhUmMIACmcbI"
  cloud_id  = "b1gb9eakt5frgarp30lf"
  folder_id = "b1gv76raeip8oj3msgpe"
  zone      = "<ru-central1-a>"
}

