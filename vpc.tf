module "networking" {
  source                  = "./module"
  project_id              = var.project_id
  vpc_name                = "my-vpc"
  auto_create_subnetworks = false

  subnets = [
    {
      name            = "app"
      subnet_region   = "asia-south1"
      cidr_range      = "10.10.0.0/16"
      secondary_range = "192.168.10.0/24"
      create_fw_rule  = true
      source_tags     = ["web", "new"]
    },
    {
      name            = "db"
      subnet_region   = "asia-south1"
      cidr_range      = "10.20.0.0/16"
      secondary_range = "192.168.20.0/24"
      create_fw_rule  = false
      source_tags     = ["test"]
    },
    {
      name            = "app-dev"
      subnet_region   = "asia-south1"
      cidr_range      = "10.30.0.0/16"
      secondary_range = "192.168.30.0/24"
      create_fw_rule  = true
      source_tags     = ["web"]
    }
  ]
}




# module "dev_vpc" {
#   source                  = "./module"
#   project_id              = "industrial-cat-471715-a8"
#   subnet_region           = "us-east1"
#   vpc_name                = "dev-m-vpc"
#   auto_create_subnetworks = false
#   subnet_name             = "dev-m-subnet"
#   cidr_range              = "172.0.0.0/24"
#   secondary_ip_range      = "192.1.0.0/24"
#   create_fw_rule          = true
#   source_tags             = ["dev-m-vpc"]
# }

# module "test_vpc" {
#   source                  = "./module"
#   project_id              = "industrial-cat-471715-a8"
#   subnet_region           = "us-east1"
#   vpc_name                = "test-m-vpc"
#   auto_create_subnetworks = false
#   subnet_name             = "test-m-subnet"
#   cidr_range              = "172.1.0.0/24"
#   secondary_ip_range      = "192.2.0.0/24"
#   create_fw_rule          = false
#   source_tags             = ["test-m-vpc"]
# }