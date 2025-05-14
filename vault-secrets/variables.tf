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

    frontend-robo = {
      secret = "roboshop-dev"
      value  = {
        catalogue_url  = "http://catalogue-dev.yourtherapist.in:8080/"
        user_url       = "http://user-dev.yourtherapist.in:8080/"
        cart_url       = "http://cart-dev.yourtherapist.in:8080/"
        shipping_url   = "http://shipping-dev.yourtherapist.in:8080/"
        payment_url    = "http://payment-dev.yourtherapist.in:8080/"
        CATALOGUE_HOST = "catalogue-dev.yourtherapist.in"
        CATALOGUE_PORT = 8080
        USER_HOST      = "user-dev.yourtherapist.in"
        USER_PORT      = 8080
        CART_HOST      = "cart-dev.yourtherapist.in"
        CART_PORT      = 8080
        SHIPPING_HOST  = "shipping-dev.yourtherapist.in"
        SHIPPING_PORT  = 8080
        PAYMENT_HOST   = "payment-dev.yourtherapist.in"
        PAYMENT_PORT   = 8080
      }
    }

    catalogue = {
      secret = "roboshop-dev"
      value = {
        MONGO        = "true"
        MONGO_URL    = "mongodb://mongodb-dev.yourtherapist.in:27017/catalogue"
        DB_TYPE      = "mongo"
        APP_GIT_URL  = "https://github.com/roboshop-devops-project-v3/catalogue"
        DB_HOST      = "mongodb-dev.yourtherapist.in"
        SCHEMA_FILE  = "db/master-data.js"
      }
    }

    user = {
      secret = "roboshop-dev"
      value = {
        MONGO      = "true"
        REDIS_URL  = "redis://redis-dev.yourtherapist.in:6379"
        MONGO_URL  = "mongodb://mongodb-dev.yourtherapist.in:27017/users"
      }
    }

    shipping = {
      secret = "roboshop-dev"
      value = {
        CART_ENDPOINT = "cart-dev.yourtherapist.in:8080"
        DB_HOST       = "mysql-dev.yourtherapist.in"
        DB_USER       = "root"
        DB_PASS       = "RoboShop@1"
        username      = "root"
        password      = "RoboShop@1"
        DB_TYPE       = "mysql"
        APP_GIT_URL   = "https://github.com/roboshop-devops-project-v3/shipping"
      }
    }

    payment = {
      secret = "roboshop-dev"
      value = {
        CART_HOST = "cart-dev.yourtherapist.in"
        CART_PORT = "8080"
        USER_HOST = "user-dev.yourtherapist.in"
        USER_PORT = "8080"
        AMQP_HOST = "rabbitmq-dev.yourtherapist.in"
        AMQP_USER = "roboshop"
        AMQP_PASS = "roboshop123"
      }
    }

    cart = {
      secret = "roboshop-dev"
      value = {
        REDIS_HOST     = "redis-dev.rdevopsb84.online"
        CATALOGUE_HOST = "catalogue-dev.rdevopsb84.online"
        CATALOGUE_PORT = 8080
      }
    }

    rabbitmq = {
      secret = "roboshop-dev"
      value = {
        username = "roboshop"
        password = "roboshop123"
      }
    }

    mysql = {
      secret = "roboshop-dev"
      value = {
        username = "root"
        password = "RoboShop@1"
      }
    }
  }
}
