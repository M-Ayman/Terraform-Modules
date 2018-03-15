variable "region" {
  description = "AWS region. Changing it will lead to loss of complete stack."
  default = "us-east-1"
}

 variable "environment"{
   default = "test"
 }
