<div align="center">
    <img width="128" style="padding-bottom: 10px;" src="./static/img/Neovim-Logo-1.png"></img>

![Go](https://img.shields.io/badge/language-go-%2389b4fa?style=for-the-badge&logo=go&logoColor=white)
![Terraform](https://img.shields.io/badge/IaC-terraform-%23cba6f7?style=for-the-badge&logo=terraform&logoColor=white)
![Kubernetes](https://img.shields.io/badge/runtime-kubernetes-%2389b4fa?style=for-the-badge&logo=kubernetes&logoColor=white)
![Treesitter](https://img.shields.io/badge/plugin-treesitter-%23f2cdcd?style=for-the-badge&logo=treesitter&logoColor=white)
![Telescope](https://img.shields.io/badge/plugin-telescope-%23f2cdcd?style=for-the-badge&logo=lua&logoColor=white)

<img width="512" src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png"></img>

<img alt="neonix-mascott" width="420" src="https://pusheen.com/wp-content/uploads/2023/02/Pastel_Pusheen_Parfait.jpg"></img>

This is my go-to Neovim configuration for daily use.
Leveraging the power of LSP with intuitive keymaps, intelligent suggestions, and my all-time favorite colorscheme, Catppuccin.

</div>

## ✨ Features

- Standalone usability from anywhere via `nix run`.
- Home-manager integration.

## 🚀 Usage

```bash
nix develop

# Anywhere
nix run github:rgroemmer/neonix

# Local
nix run .

```

## 🏠 Home-manager

```nix
# add to inputs
neonix = {
  url = "github:rgroemmer/neonix";
  inputs.nixpkgs.follows = "nixpkgs";
};

# import module
imports = [
  inputs.neonix.homeManagerModules.neonix
];

# activate
programs.neonix = {
    enable = true;
};
```
