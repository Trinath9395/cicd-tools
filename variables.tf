variable "zone_name" {
  type = string
  default = "trinath.online"
  description = "This varaible is for route53 records"
}

variable "security_group_id" {
  default = "sg-0e142280b2978f20a"
}
