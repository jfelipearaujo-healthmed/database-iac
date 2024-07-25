variable "cache_node_type" {
  type        = string
  description = "The type of node to use for the cache"
}

variable "cache_engine" {
  type        = string
  description = "The cache engine to use"
}

variable "cache_engine_version" {
  type        = string
  description = "The version of the cache engine to use"
}

variable "cache_name" {
  type        = string
  description = "The name of the cache"
}

variable "cache_port" {
  type        = number
  description = "The port the cache will listen on"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
}

variable "services" {
  type        = list(string)
  description = "The services to attach the policies to"
}
