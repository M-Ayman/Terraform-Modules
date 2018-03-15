# Provider Configuration
provider "aws" {
  region = "${var.region}"
}

# Resource Configuration

#launch ec2
/*resource "aws_instance" "hello-instance" {
  ami = "ami-97785bed"
  instance_type = "t2.micro"
  tags {
    name = "hello-instancess"
  }
}
*/


# Create a VPC
resource "aws_vpc" "MY-VPC" {
  cidr_block = "10.2.0.0/16"
}

# create a public subnet
resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.MY-VPC.id}" #REFRENCE TO VPC ID
  cidr_block = "10.2.1.0/24"
}

#modules
module "custom-module" {
  source    = "./modules/application"
  vpc_id    = "${aws_vpc.MY-VPC.id}"
  subnet_id = "${aws_subnet.public.id}"
  name      = "Cutom Module"
  # override the default value in the custom module
  environment = "${var.environment}"
}

/*resource "aws_instance" "slave-ec2" {
  ami           = "ami-97785bed"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public.id}"
  tags {
    master-hostname = "${aws_instance.master-ec2.private_dns}"
  }
  lifecycle {
    ignore_changes = ["tags"]
  }
  depends_on    = ["aws_instance.master-ec2"]
}
*/
