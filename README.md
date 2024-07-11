
# Pritunl VPN Infrastructure as Code (IaC) Repository

## Overview

This repository contains Infrastructure as Code (IaC) configurations to install and run Pritunl VPN on AWS EC2 Ubuntu machines using Terraform and Ansible. It is designed to automate the deployment process, ensuring a consistent and reproducible setup.

## Repository Structure

```plaintext
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── ...
│
├── ansible/
│   ├── pritunl_playbook.yaml
│   └── ...
│
├── README.md
└── ...
```

## Getting Started

### Prerequisites

- AWS CLI configured with appropriate permissions
- Terraform installed

### Terraform Setup

1. **Initialize Terraform:**
   ```sh
   cd terraform
   terraform init
   ```

2. **Apply Terraform Configuration:**
   ```sh
   terraform apply
   ```

   This will create the necessary AWS infrastructure for Pritunl VPN and automatically run the Ansible playbook to configure the server.

## Files

### Terraform Files

- **main.tf:** Contains the main configuration for provisioning AWS resources.
- **variables.tf:** Defines the input variables for the Terraform configuration.
- **outputs.tf:** Specifies the outputs from the Terraform configuration.

### Ansible Files

- **pritunl_playbook.yaml:** An Ansible playbook to install and configure Pritunl VPN and its dependencies on an Ubuntu machine. This playbook is invoked automatically by the Terraform script.

## Future Plans

- Support for additional cloud providers and operating systems.
- Enhanced security configurations and best practices.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or new features.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or support, please open an issue in this repository.