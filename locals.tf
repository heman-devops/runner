locals {
    ami_id = data.aws_ami.heman.id
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
    common_name = "${var.project}-${var.environment}"
    public_subnet_id = split("," , data.aws_ssm_parameter.public_subnet_ids.value)[0]
    vpc_id = data.aws_ssm_parameter.vpc_id.value
}