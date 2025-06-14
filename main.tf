provider "aws" {
  region = "ap-southeast-1" # adjust based on your region
}

resource "aws_dynamodb_table" "monica-bookinventory-tf" {
  name         = "monica-bookinventory-tf"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ISBN"

  attribute {
    name = "ISBN"
    type = "S"
  }

    tags = {
    Name        = "Book Inventory"
    Environment = "Dev"
  }
}

resource "null_resource" "insert_books" {
  depends_on = [aws_dynamodb_table.monica-bookinventory-tf]  # ensures table is ready

  provisioner "local-exec" {
    command = <<EOT
aws dynamodb put-item --table-name bookinventory --item '{
  "ISBN": {"S": "978-0134685991"},
  "Genre": {"S": "Technology"},
  "Title": {"S": "Effective Java"},
  "Author": {"S": "Joshua Bloch"},
  "Stock": {"N": "1"}
}'
EOT
  }
}