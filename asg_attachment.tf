resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = "${var.autoscaling_group_name}"
  alb_target_group_arn   = "${aws_lb_target_group.application_target_group.arn}"
}