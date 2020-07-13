resource "aws_apigatewayv2_api" "api" {
  name          = "${var.project}-${var.api_name}-${var.environment}"
  protocol_type = "${var.protocol_type}"

  tags = {
	Name         = "${var.project}-${var.api_name}-${var.environment}"
	MaintainedBy = "Terraform"
	Project = "${var.project}"
	Environment = "${var.environment}"
	ApprovedBy = "${var.approvedBy}"
	CreatedBy = "${var.createdBy}"
	CenterCost = "${var.centercost}"
  }
}

resource "aws_apigatewayv2_stage" "api_default_stage" {
  api_id 		= "${aws_apigatewayv2_api.api.id}"
  name   		= "$default"
  auto_deploy	= "true"

  tags = {
	Name         = "${var.project}-api_stage-${var.api_name}-${var.environment}"
	MaintainedBy = "Terraform"
	Project = "${var.project}"
	Environment = "${var.environment}"
	ApprovedBy = "${var.approvedBy}"
	CreatedBy = "${var.createdBy}"
	CenterCost = "${var.centercost}"
  }
}

resource "aws_apigatewayv2_integration" "api_integration" {
  api_id           = "${aws_apigatewayv2_api.api.id}"
  integration_type = "${var.integration_type}"

  connection_id				= "${var.vpc_link_id}"
  connection_type           = "VPC_LINK"

  integration_method        = "${var.integration_method}"
  integration_uri           = "${var.alb_listener_arn}"

  depends_on = [aws_apigatewayv2_api.api]

}

resource "aws_apigatewayv2_route" "api_default_route" {
  api_id    = "${aws_apigatewayv2_api.api.id}"
  route_key = "$default"
  target	= "integrations/${aws_apigatewayv2_integration.api_integration.id}"

  depends_on = [aws_apigatewayv2_integration.api_integration]

}

resource "aws_apigatewayv2_route" "api_any_route" {
  api_id    = "${aws_apigatewayv2_api.api.id}"
  route_key = "ANY /"
  target	= "integrations/${aws_apigatewayv2_integration.api_integration.id}"

  depends_on = [aws_apigatewayv2_integration.api_integration]

}


