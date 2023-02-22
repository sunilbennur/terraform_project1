terraform {
    backend "s3" {
      bucket = "mycloudstorage-sriram"
      #key = "terraform.tfstate"
      #encrypt = true
      region = "us-east-1"
      dynamodb_table = "dynamodb-state-loking"
    }
}