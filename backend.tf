terraform {
  backend "s3" {
    bucket         = "terraform-backend-devops-iti"
    key            = "terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "backendtable"
  }
}