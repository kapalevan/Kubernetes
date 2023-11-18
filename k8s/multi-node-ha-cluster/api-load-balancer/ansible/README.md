# HAProxy Configuration Using Ansible

This document provides a guide on how to use Ansible for configuring a virtual machine with HAProxy, including setting DNS servers, updating the system, and installing and configuring HAProxy.

## Prerequisites

- Ansible installed on your control machine.
- Access to a target VM (running Ubuntu) where HAProxy will be configured.
- The target VM should have SSH enabled and accessible with the provided credentials.

## Files Description

1. **`configure-vm.yml`**: This is the main Ansible playbook that contains all the tasks for configuring the VM.

2. **`vars.yml`**: This file contains variable definitions used in the playbook, such as DNS servers and backend server details.

3. **`vault.yml`**: An encrypted file created using Ansible Vault for storing sensitive information like SSH credentials.

4. **`haproxy.cfg.j2`**: A Jinja2 template file for generating the HAProxy configuration.

5. **`hosts`**: The Ansible inventory file, listing the VMs to be configured.

## Configuration Steps

1. **Prepare the Playbook and Variable Files**:
   - Place the `configure-vm.yml`, `vars.yml`, `haproxy.cfg.j2`, and `hosts` files in your working directory.
   - Modify the `vars.yml` file to match your specific configuration requirements (IP addresses, DNS servers, etc.).

2. **Set Up the Ansible Vault**:
   - Create the `vault.yml` file to securely store sensitive data:
     ```bash
     ansible-vault create vault.yml
     ```
   - Add the SSH credentials to this file and save it.

3. **Update the Hosts Inventory**:
   - Edit the `hosts` inventory file to include the IP address and SSH credentials of your target VM.

4. **Customize the HAProxy Template**:
   - Update the `haproxy.cfg.j2` template if necessary to match your HAProxy configuration requirements.

## Running the Playbook

To run the playbook and configure your VM, use the following command:

```bash
ansible-playbook -i hosts configure-vm.yml --ask-vault-pass
```

You will be prompted for the vault password. Enter it to proceed with the execution.

## How It Works

- When the playbook runs, it connects to the VM(s) listed in the `hosts` file using the SSH credentials provided.
- It then executes the tasks defined in `configure-vm.yml` in the following order:
  1. **Set DNS Servers**: Configures the DNS settings using Netplan.
  2. **Update System Packages**: Performs an update and upgrade of the system packages.
  3. **Install HAProxy**: Installs the HAProxy package on the VM.
  4. **Configure HAProxy**: Generates the HAProxy configuration file from the template and restarts the HAProxy service.

- The playbook uses `sudo` for tasks that require elevated privileges, ensuring the configurations are applied correctly.

## Note

Ensure that the user specified in the `vault.yml` file has sudo privileges on the target VM without requiring a password prompt for seamless execution. If a password is required for sudo, you'll need to run the playbook with the `--ask-become-pass` flag to provide the sudo password:

```bash
ansible-playbook -i hosts configure-vm.yml --ask-vault-pass --ask-become-pass
```

This documentation provides a basic outline for using Ansible to configure HAProxy on a VM. Depending on your specific infrastructure and security requirements, further customization of the playbook and configuration files may be necessary.