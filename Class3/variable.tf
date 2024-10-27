variable region {
  type        = string
  default     = "us-east-1"
  description = "provide region"
}

variable key_name {
  type        = string
  default     = "ohio-key"
  description = "provide key-pair name"
}

variable key_file {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "provide key-pair location"
}