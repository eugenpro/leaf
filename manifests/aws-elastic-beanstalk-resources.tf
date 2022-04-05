resource "aws_elastic_beanstalk_application" "elasticapp" {
  name = var.elasticapp
}

resource "aws_elastic_beanstalk_environment" "beanstalk-env" {
  name                = local.name
  application         = aws_elastic_beanstalk_application.elasticapp.name
  solution_stack_name = var.solution_stack_name
  tier                = var.tier

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = module.vpc.vpc_id
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "True"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = join(",", module.vpc.public_subnets)
  }

    setting {
    namespace = "aws:ec2:vpc"
    name = "ELBSubnets"
    value = join(",", module.vpc.public_subnets)
  }

setting {
    namespace = "aws:ec2:vpc"
    name = "DBSubnets"
    value = join(",", module.vpc.private_subnets)
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internet facing"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = 1
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = 2
  }
  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }

    setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_USERNAME"
    value = "${module.rdsdb.db_instance_username}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_PASSWORD"
    value = "${module.rdsdb.db_instance_password}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_DATABASE"
    value = "${module.rdsdb.db_instance_name}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_HOSTNAME"
    value = "${module.rdsdb.db_instance_endpoint}"
  }
  
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "REDIS_URL"
    value = "${aws_elasticache_replication_group.default.configuration_endpoint_address}"
    
  }


}


