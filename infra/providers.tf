terraform {
    version = ">=1.6.0"
    required_provider {
        aws {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" = {
    region = vars.aws_region
    profile = vars.aws_profile
}