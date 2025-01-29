# NixOS Configuration with Flakes & Home Manager

This repository contains my NixOS configuration, leveraging **Nix Flakes** and **Home Manager** for system and user configuration.

## Features
- **Nix Flakes** for improved dependency management and reproducibility.
- **Home Manager** for user-specific configurations.
- **Modular configuration** for better maintainability.

## Installation
### 1. Boot into NixOS Live Environment
Ensure you have a working NixOS live environment.

### 2. Enable Nix Flakes
```sh
sudo mkdir -p /etc/nix
sudo nano /etc/nix/nix.conf
```
Add the following:
```
experimental-features = nix-command flakes
```

### 3. Clone the Repository
```sh
git clone https://github.com/yourusername/nixos-config.git
cd nixos-config
```

### 4. Install NixOS using Flakes
```sh
sudo nixos-rebuild switch --flake .
```


## Repository Structure
```plaintext
.
├── flake.nix         # Entry point for Nix Flakes
├── flake.lock        # Lock file for flake dependencies
├── home/             # Home Manager configurations
└── README.md         # Documentation
```

## Updating the System
### Update Flake Inputs
```sh
nix flake update
nix flake lock --update-input nixvim_flake # only update a specific input
```
### Rebuild the System
```sh
sudo nixos-rebuild switch --flake .
```

## Useful Commands
- Check Nix configuration: `nix doctor`
- Test configuration without applying: `nixos-rebuild dry-run --flake .`
- List installed generations: `nix-env --list-generations`

## Troubleshooting
If you run into issues, try:
- Checking logs: `journalctl -xe`
- Rebuilding from scratch: `sudo nixos-rebuild switch --flake . --upgrade`
- Cleaning up old generations: `sudo nix-collect-garbage -d`

## License
This project is licensed under the MIT License.

---


