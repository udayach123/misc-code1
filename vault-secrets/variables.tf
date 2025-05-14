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
    ssh = {
      secret = "roboshop-infra"
      value = {
        username = "devops18"
        password = "Passw0rd@1234"
      }
    }
  }
}
  frontend-robo = {
    secret = "roboshop-dev"
    value  = {
      catalogue_url = "http://catalogue-dev.yourtherapist.in:8080/"
      user_url      = "http://user-dev.yourtherapist.in:8080/"
      cart_url      = "http://cart-dev.yourtherapist.in:8080/"
      shipping_url  = "http://shipping-dev.yourtherapist.in:8080/"
      payment_url   = "http://payment-dev.yourtherapist.in:8080/"
    }
  }