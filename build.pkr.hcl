build {
sources=[
  "source.amazon-ebs.snowflake"
  ]

  provisioner "shell" {
     scripts=[
       "snowflake/install-snowflake.sh"
       ]
    }
}
