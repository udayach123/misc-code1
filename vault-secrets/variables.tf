variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "Roboshop app component for all secrets"
    }
  }
}