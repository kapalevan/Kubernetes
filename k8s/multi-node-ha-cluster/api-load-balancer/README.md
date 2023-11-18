# High-Level Documentation for Provisioning and Configuring `api-server-lb` with Terraform and Ansible

This documentation provides an end-to-end guide for provisioning a Virtual Machine (VM) for an `api-server-lb` (API Server Load Balancer) using Terraform, and configuring it using Ansible. This process covers all the necessary steps from VM creation to its configuration.

## Prerequisites

- Terraform installed
- Ansible installed
- Access to a VMware vSphere environment
- SSH access to the provisioned VM

## 1. Provisioning VM with Terraform

### Step 1: Terraform Configuration

- **Directory Structure**: Organize your Terraform files in your project directory, for example:

  ```
  Kubernetes/
  └── k8s/
      └── multi-node-ha-cluster/
          └── api-load-balancer/
              └── terraform/
                  ├── main.tf
                  ├── variables.tf
                  └── terraform.tfvars
  ```

- **`main.tf`**: Contains the Terraform configuration for provisioning the VM in VMware vSphere.

- **`variables.tf`**: Defines the variables used in `main.tf`.

- **`terraform.tfvars`**: Stores the values for the variables defined in `variables.tf`.

### Step 2: Initialize Terraform

Run `terraform init` in the `terraform/` directory to initialize the Terraform environment.

### Step 3: Plan and Apply

Execute `terraform plan` to preview the VM creation, and `terraform apply` to provision the VM in your vSphere environment.

## 2. Configuring VM with Ansible

### Step 1: Ansible Playbook and Inventory

- **Directory Structure**:

  ```
  Kubernetes/
  └── k8s/
      └── multi-node-ha-cluster/
          └── api-load-balancer/
              └── ansible/
                  ├── configure-vm-api-server-lb.yml
                  ├── hosts
                  ├── vault.yml
                  ├── vars.yml
                  ├── haproxy.cfg.j2
                  └── netplan-config.j2
  ```

- **`configure-vm-api-server-lb.yml`**: The Ansible playbook that contains tasks for VM configuration.

- **`hosts`**: The inventory file listing the VM's IP address.

- **`vault.yml`**: An encrypted file storing sensitive data like `ansible_become_pass`.

- **`vars.yml`**: Contains variables used in the playbook.

- **`templates/netplan-config.j2`**: Jinja2 template for generating the Netplan configuration.

### Step 2: Running the Ansible Playbook

- Use the command `ansible-playbook -i hosts configure-vm-api-server-lb.yml --ask-vault-pass` to run the playbook.
- Enter the vault password when prompted.

### Step 3: Playbook Execution

- The playbook will execute tasks such as setting DNS servers, updating and upgrading system packages, installing HAProxy, and configuring HAProxy using the provided template.

## 3. Post-Configuration Checks

- Verify the VM's configuration by SSH'ing into the VM and checking services like HAProxy.

## 4. Documentation and Version Control

- Maintain a `README.md` in the root directory documenting the process.
- Use version control (e.g., Git) to manage changes in your Terraform and Ansible configurations.

---