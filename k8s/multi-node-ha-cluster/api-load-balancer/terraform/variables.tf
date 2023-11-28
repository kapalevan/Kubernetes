variable "api-server" {
  description = "Map of api-server with appropriate properties"
  type = map(object({
    ipv4_address    = string
    ipv4_netmask    = number
    ipv4_gateway    = string
    domain          = string
    dns_suffix_list = list(string)
    dns_server_list = list(string)
  }))
}

variable "vcenter_server" {
  description = "vCenter server address"
}

variable "template_name" {
  description = "OS Template name"
}

#variable "vm_domain" {
#  description = "Domain for the VM"
#}

variable "vm_folder" {
  description = "The destination folder for the VM in vSphere"
  type        = string
}

variable "vsphere_user" {
  description = "Username for vSphere"
  type        = string
}

variable "vsphere_password" {
  description = "Password for vSphere"
  type        = string
}

variable "datacenter_name" {
  description = "The name of the vSphere datacenter"
  type        = string
}

variable "datastore_name" {
  description = "The name of the vSphere datastore"
  type        = string
}

variable "network_name" {
  description = "The name of the vSphere network"
  type        = string
}

#variable "resource_pool_name" {
#  description = "The name of the vSphere resource pool"
#  type        = string
#}

variable "cluster_name" {
  description = "The name of the vSphere cluster"
  type        = string
}

#variable "ipv4_gateway" {
#  description = "The IPv4 gateway for the VM"
#  type        = string
#}

#variable "dns_servers" {
#  description = "List of DNS servers"
#  type        = list(string)
#}

#variable "ssh_username" {
#  description = "SSH username for the VM"
#  type        = string
#}

#variable "ssh_password" {
#  description = "SSH password for the VM"
#  type        = string
#  sensitive   = true  # Marks the variable as sensitive, preventing it from being displayed in logs
#}