To deploy services in API Gateway you need the following resources:

	ALB**
	ALB listener**
	ALB target group
	ASG Attachment
	VPC Link**
	API
	API Stage
	API Gateway Integration
	API Route
	
** These resources are created in the main deployment

The other resources will be created using these scripts

In terraform.tfvars you need to add the following values:
(These values can be acquired from the main deployment)

	vpc_id=
	autoscaling_group_name=
	vpc_link_id=
	alb_listener_arn=
	
In terraform.tfvars you MUST change this values according to
the parameters of the service you want to deploy
	
	target_group_name=
	target_group_port=
	target_group_protocol=
	api_name=
	
You will need to configure manually the rules to redirect
from the ALB listener to the ALB target group


	