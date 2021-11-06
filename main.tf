
module "ec2" {
  source   = "./ec2/"
  my_ami   = "ami-0d1bf5b68307103c2"
  my_count = 2
  my_disk  = ["8", "10"]
  ebs_disk = ["1","2"]
  attach = ["/dev/sdf","/dev/sdg"]
}
