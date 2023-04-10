{
  description = "A Rust template using Nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils }:
    let supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" ];
    in flake-utils.lib.eachSystem supportedSystems (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };

        # get current working directory
        cwd = builtins.toString ./.;
        rust =
          pkgs.rust-bin.fromRustupToolchainFile "${cwd}/rust-toolchain.toml";
          
        sharedInputs = (with pkgs; [
          rust
        ]);
      in {

        devShell = pkgs.mkShell {
          buildInputs = sharedInputs;

        formatter = pkgs.nixpkgs-fmt;
        };

        # You can build this package (the roc CLI) with the `nix build` command.
        packages.default = import ./. { inherit pkgs; };
      });
}
