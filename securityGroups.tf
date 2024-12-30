resource "aws_security_group" "all_worker_mgmt" {
  name        = "allow_all_worker_management"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "manaswini_terraform_security_group"
  }
}

resource "aws_security_group_rule" "all_worker_mgmt_ingress" {
  description = "allow inbound traffic from eks"
  security_group_id = aws_security_group.all_worker_mgmt.id
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  type = "ingress"
  cidr_blocks       = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16",
  ]
}

resource "aws_security_group_rule" "all_worker_mgmt_egress" {
  description = "allow outbound traffic to anywhere"
  security_group_id = aws_security_group.all_worker_mgmt.id
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  type = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
