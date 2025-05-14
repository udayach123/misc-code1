variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "Roboshop app component for all secrets"
    }
    roboshop-infra = {
      description = "Roboshop infra related secrets"
    }
  }
}

variable "values" {
  default = {
    cart = {
      secret = "roboshop-dev"
    }

    ssh = {
      secret = "roboshop-infra"
      value = {
        username = "devops18"
        password = "Passw0rd@1234"
      }
    }
  }
}
