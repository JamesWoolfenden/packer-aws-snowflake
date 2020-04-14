build {
sources=[
  "source.amazon-ebs.snowflake"
  ]

  provisioner "shell" {
     scripts=[
       "packer-aws-snowflake/install-snowflake.sh"
       ]
    }
}
