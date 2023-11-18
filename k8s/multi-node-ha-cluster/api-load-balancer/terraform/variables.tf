variable "vm_name" {
  description = "Name of the VM"
}

variable "vcenter_server" {
  description = "vCenter server address"
}

variable "template_name" {
  description = "OS Template name"
}

variable "vm_ip" {
  description = "IP Address for the VM"
}

variable "vm_hostname" {
  description = "Hostname for the VM"

}
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