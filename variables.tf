variable "tools" {
  default = {
    vaultnew = {
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
variable "token" {}
