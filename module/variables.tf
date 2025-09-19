variable "project_id" {
  description = "The project ID to deploy resources"
  type        = string
  default     = "industrial-cat-471715-a8"

}


variable "subnets" {
  type = list(object({
    name               = string
    subnet_region             = string
    cidr_range         = string
    secondary_range    = string
    create_fw_rule     = bool
    source_tags        = list(string)
  }))
}


variable "vpc_name" {
  type = string
  default = "dev-vpc"
}

variable "auto_create_subnetworks" {
  type = bool
  default = false
}

# variable "subnet_name" {
#   type = string
# }

# variable "cidr_range" {
#   type = string
# }

# variable "secondary_ip_range" {
#   type = string
# }

# variable "subnet_region" {
#   type = string
# }

# variable "create_fw_rule" {
#   type = bool
# }

# variable "source_tags" {
# type = list(string)
# default = [""]
# }