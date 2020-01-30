variable "region" {
    default = "us-east-2"
}

variable "env_name" {
  default = "Minsk"
}

variable "access_ip" {
  default = "0.0.0.0/24"
}

variable "instance_type" {
  default = "t2.medium"
}


variable "key_name" {
  default = "Berlin-2019.pem.txt"
}

variable "public_key_path" {
  default =  "~/.ssh/Berlin-2019.pem.txt"
}



