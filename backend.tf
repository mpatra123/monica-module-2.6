terraform {
  backend "s3" {
    bucket         = "sctp-ce10-tfstate"   # replace this
    key            = "monica-dynamodb.tfstate"
    region         = "ap-southeast-1"                 # or your bucket’s region
    #dynamodb_table = "terraform-lock-table"           # must match the table you created
    #encrypt        = true
  }
}