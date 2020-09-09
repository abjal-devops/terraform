resource "aws_instance" "ec2" {
  count                       = "${var.instance_count}"  
  ami                         = "ami-0603cbe34fd08cb81"
  instance_type               = "${var.instance_type}" 
  key_name                    = "abs"  
  subnet_id                   = aws_subnet.pub.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.mySG.id]
  depends_on                  = [aws_security_group.mySG,aws_internet_gateway.my_gw]
  tags = {
    Name  = "instance-${count.index + 1}"
  }
}
