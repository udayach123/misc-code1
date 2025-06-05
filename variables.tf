variable "tools" {
  default = {
    vault = {
      vm_size = "Standard_B2s"
    }
     github-runner = {
       vm_size = "Standard_B2s"
    }
  }
}

variable "rg_name" {
  default = "golive"
}

variable "rg_location" {
  default = "UK West"
}
variable "token" {}


