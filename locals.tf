locals {
    ami_id = data.aws_ami.heman.id
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
    common_name = "${var.project}-${var.environment}"
    private_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
}