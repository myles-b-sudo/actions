terraform {
  backend "s3" {
    bucket         = "tf-state-myles-atlas"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"

  }
}