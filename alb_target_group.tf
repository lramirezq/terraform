resource "aws_lb_target_group" "application_target_group" {
  name     = "${var.target_group_name}-${var.environment}"
  port     = "${var.target_group_port}"
  protocol = "${var.target_group_protocol}"
  vpc_id   = "${var.vpc_id}"
  
  health_check {
       interval = 30
       path = "/"
       port = "traffic-port"
       protocol = "HTTP"
       timeout = 5
       unhealthy_threshold = 2
       healthy_threshold = 5
   }

  tags = {
	Name         = "${var.project}-alb_target_group-${var.environment}"
	MaintainedBy = "Terraform"
	Project = "${var.project}"
	Environment = "${var.environment}"
	ApprovedBy = "${var.approvedBy}"
	CreatedBy = "${var.createdBy}"
	CenterCost = "${var.centercost}"
  }

}
