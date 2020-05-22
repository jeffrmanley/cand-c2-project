provider "aws" {
  profile    = "jeffrmanleynet"
  region     = "us-east-1"
}

resource "aws_instance" "Udacity_T2" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  count = 4  
  tags = {
	Name = "Udacity T2"}
}

resource "aws_instance" "Udacity_M4" {
  ami           = "ami-2757f631"
  instance_type = "m4.large"
  count = 2
  tags = {
	Name = "Udacity M4"}

}