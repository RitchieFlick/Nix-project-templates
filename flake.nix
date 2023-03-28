{
  description = "Simple and personal template for Rust projects";
  outputs = { self, ... }: {
    templates = {
      rust = {
        path = ./rust;
        description = "Simple Rust project";
      };
      fullrust = {
        path = ./fullrust;
        description = "Rust project using devenv.sh and a Rust REPL";
      };
    };
  };
}
