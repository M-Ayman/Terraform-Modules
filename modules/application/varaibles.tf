/*variable "region" {
  description = "AWS region. Changing it will lead to loss of complete stack."
  default     = "us-east-1"
}
*/

variable "environment" {
  default = "dev"
}

variable "instance_type" {
  type = "map"

  default = {
    dev  = "t2.micro"
    test = "t2.medium"
    prod = "t2.large"
  }
}
