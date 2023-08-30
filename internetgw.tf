resource "aws_internet_gateway" "Internetgateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}