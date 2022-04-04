variable "node_groups" {
  description = "Number of nodes groups to create in the cluster"
  default     = 3
}

variable "cluster_id" {
  description = "Id to assign the new cluster"
}


variable "namespace" {
  description = "Default namespace"
}