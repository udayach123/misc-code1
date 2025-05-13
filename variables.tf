variable "tools" {
  default = {
    vault = {
      vm_size = "Standard_B2ts_v2"
    }
  }
}

variable "rg_name" {
  default = "golive"
}
variable "rg_location" {
  default = "UK West"
}
