terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.39.0"
    }
  }
  required_version = ">= 0.14"

}

provider "aws" {
  profile = "cache"
  region = "eu-west-1"
}

resource "aws_key_pair" "aws_key" {
  key_name   = "terraform-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC57znTsy03q7yBLM2CFnXaqLVyy06jfkxuEyBPj/HY1laRxPuVmauuHjnIfbYDnqkz/c8QSMPUmSd8aAgUOuntql9iwzXPLbMlpfySLl+TvprYZ6JHzf3OyiJ19WXesa/g4SvsIXHCGpmjiSIx7Kzl3yyRaOnJp8hs14nIwyRNHRX7TUkVDCqlG2N709mn5MZHjnILvA7rgAJZJ2HdNeXU1yE28Fg2ksEfJZxAEkux5IoCbKyqFCyhycAI769IyS04frFFTdut5Vi/e1vYrZ6cFvuN8OrysooU7jdhE+GxPtTnK2BXQ+rEDwL1L9bGcEimX3jUJUkYUkPirhXn7NQpQ0PprZGkiZat3HHL8aVCSRWL8eI8xGsnNxuiDL4qHq5HKUxGOiDRFMAfpwVJrEqGrhTAz8/RBiaXm6ii4upk7/oH9XfYg5Ee/9je5sXFoFys+UCRFIhbeFBQb1ZE8Ich+AGMMhhiCSlxfCGOchwNpMAYiH8QLptwnPsrU9h6Z7s= ndc-production-20210309"
}

resource "aws_key_pair" "aws_key_internal" {
  key_name   = "internal-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC57znTsy03q7yBLM2CFnXaqLVyy06jfkxuEyBPj/HY1laRxPuVmauuHjnIfbYDnqkz/c8QSMPUmSd8aAgUOuntql9iwzXPLbMlpfySLl+TvprYZ6JHzf3OyiJ19WXesa/g4SvsIXHCGpmjiSIx7Kzl3yyRaOnJp8hs14nIwyRNHRX7TUkVDCqlG2N709mn5MZHjnILvA7rgAJZJ2HdNeXU1yE28Fg2ksEfJZxAEkux5IoCbKyqFCyhycAI769IyS04frFFTdut5Vi/e1vYrZ6cFvuN8OrysooU7jdhE+GxPtTnK2BXQ+rEDwL1L9bGcEimX3jUJUkYUkPirhXn7NQpQ0PprZGkiZat3HHL8aVCSRWL8eI8xGsnNxuiDL4qHq5HKUxGOiDRFMAfpwVJrEqGrhTAz8/RBiaXm6ii4upk7/oH9XfYg5Ee/9je5sXFoFys+UCRFIhbeFBQb1ZE8Ich+AGMMhhiCSlxfCGOchwNpMAYiH8QLptwnPsrU9h6Z7s= ndc-production-20210309"
}