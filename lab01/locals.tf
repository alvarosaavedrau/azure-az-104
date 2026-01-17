locals {
  az_location              = "spaincentral"
  az_location_abbreviation = "es"
  project                  = "lab01"
  owner                    = "aspu"
  prefix                   = "${local.az_location_abbreviation}-${local.owner}-${local.project}"

  tags = {
    Producto    = upper(local.project)
    Pais        = "Spain"
    Deployment  = "Terraform"
    Owner       = upper(local.owner)
    Description = "Project to learn about AZ-104"
  }
}
