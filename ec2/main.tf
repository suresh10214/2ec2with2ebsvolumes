resource "aws_instance" "ec2" {
  count         = var.my_count
  ami           = var.my_ami
  instance_type = "t2.micro"
  availability_zone = "eu-west-1c"
  tags = {
    Name = "HelloWorld-${count.index}"
  }

  root_block_device {
   # count = var.my_disk
    volume_size = var.my_disk[count.index]
    #for_each = var.my_disk
    tags = {
      Name = "HelloWorld-${count.index}"
    }
  }
}


resource "aws_ebs_volume" "ebs" {
   count = length(var.ebs_disk)
  #for_each          = var.ebs_disk
  availability_zone = "eu-west-1c"
  size              = "${ var.ebs_disk[count.index]}"
  

}


resource "aws_volume_attachment" "ebs-vol" {
count = length(var.ebs_disk)
  device_name = "${var.attach[count.index]}"
  #volume_id   = "${var.ebs_disk[count.index]}"
  instance_id = "${aws_instance.ec2[0].id}"
  volume_id = "${aws_ebs_volume.ebs[count.index].id}"
  
}
