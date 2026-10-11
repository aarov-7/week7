variable "project_network" {
  description = "Name of the existing CSC project network"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Source address allowed to SSH, in CIDR form, e.g. 203.0.113.5/32"
  type        = string

  validation {
    condition     = can(cidrhost(var.ssh_allowed_cidr, 0))
    error_message = "Must be a valid CIDR, e.g. 203.0.113.5/32 (don't forget the /32)."
  }

  validation {
    condition     = var.ssh_allowed_cidr != "0.0.0.0/0"
    error_message = "Do not open SSH to the whole internet."
  }
}

variable "student_name" {
  description = "Name"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for all resource names"
  type        = string
  default     = "week7"
}

variable "image_name" {
  description = "Image"
  type        = string
  default     = "Ubuntu-22.04"
}

variable "flavor_name" {
  description = "VM flavor"
  type        = string
  default     = "standard.tiny"
}

variable "ssh_public_key_path" {
  description = "Path to public key"
  type        = string
  default     = "~/.ssh/week7_ed25519.pub"
}

variable "page_message" {
  description = "Message"
  type        = string
  default     = "Hello!"
}