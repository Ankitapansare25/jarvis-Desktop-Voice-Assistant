variable "region" {
  default = "ap-south-1"
}

variable "ami" {
  default = "ami-0d176f79571d18a8f" 
  }

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "mumbai"
}

variable "Jarvis-sg" {
    default = ["sg-0a809018f9f63b94e"]
  
}