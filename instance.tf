#Author : Sunil Rathod
#Description: created two instance for 3 tier arch application practice
########################################################################

resource "aws_instance" "web" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  key_name                    = "keypair"
  subnet_id                   = aws_subnet.public[count.index].id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count                       = 2

  tags = {
    Name = "WebServer"
  }

  provisioner "file" {
    source      = "/home/sunil/keypair.pem"
    destination = "/home/ubuntu/keypair.pem"

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/sunil/keypair.pem")
    }
  }
}

resource "aws_instance" "db" {
  ami                    = "ami-0557a15b87f6559cf"
  instance_type          = "t2.micro"
  key_name               = "keypair"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server"
  }
}
