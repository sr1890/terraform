locals {
  vpc_name = "${terraform.workspace == "dev" ? "javahome-dev" : "javahome-prod"}"
}
