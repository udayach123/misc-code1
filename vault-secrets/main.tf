variable "token" {}
provider "vault" {
  address = "http://vault.yourtherapist.in:8200"
  token   =  var.token
}

resource "vault_mount" "kv" {
  for_each =  var.secrets
  path        = each.key
  type        = "kv"
  options     = { version = "2" }
  description = each.value["description"]
}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "Roboshop app component for all secrets"
    }
  }
}