variable "elasticapp" {
  default = "leaf"
}

variable "solution_stack_name" {
  type = string
}
variable "tier" {
  type = string
}

variable "min_size" {
  type = number
  default = 1
}

variable "max_size" {
  type = number
  default = 2
}