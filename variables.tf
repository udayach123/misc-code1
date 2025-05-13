variable "tools" {
  default = {
    vault = {
      vm_size = "Standard B2ts v2"
    }
  }
}

variable "rg_name" {
  default = "golive"
}
variable "rg_location" {
  default = "UK West"
}
