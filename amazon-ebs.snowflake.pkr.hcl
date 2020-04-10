source "amazon-ebs" "snowflake" {
      ami_description= "amazon snowflake AMI"
      ami_name       = "snowflake-BASE-v${var.BUILD_NUMBER}-{{timestamp}}-AMI"
      ami_users      = var.ami_users
      ami_virtualization_type    = "hvm"
      associate_public_ip_address= var.associate_public_ip_address
      instance_type  = var.instance_type
      region         = var.region
      run_tags {
        Name= "amazon-snowflake-packer"
        Application= "snowflake"
      }
      spot_price  = "auto"
      ssh_username= "ec2-user"
      ssh_interface= var.ssh_interface

      subnet_id=var.subnet_id

      source_ami_filter {
        filters {
          virtualization-type= "hvm"
          name= "amzn2-ami-hvm-*-x86_64-ebs"
          root-device-type= "ebs"
        }
        most_recent= true
        owners= ["amazon"]
      }

      temporary_key_pair_name= "amazon-packer-{{timestamp}}"

      vpc_id=var.vpc_id

      tags {
        OS_Version  = "Amazon 2 linux"
        Version     = var.BUILD_NUMBER
        Application = "snowflake Image"
        Runner      = "EC2"
      }
    }
