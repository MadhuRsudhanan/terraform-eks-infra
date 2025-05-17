terraform {
  backend "s3" {
    bucket         = "my-tf-state-bucket"
    key            = "eks-cluster/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
