variable "organization_name" {
  default = "my-org"
}
variable "team_admin" {}
variable "team_dev" {}
variable "team_names" {
  type    = list(string)
  default = ["admin1", "dev1"]
}