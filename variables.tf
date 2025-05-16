variable "tools" {
  default = {
    vault = {
      vmnew_size = "Standard_B2s"
    }
  }
}

variable "rg_name" {
  default = "golive"
}

variable "rg_location" {
  default = "UK West"
}

