{
  description = "Simple and personal template for Rust projects";
  outputs = { self, ... }: {
    templates = {
      rust = {
        path = ./rust;
        description = "Simple Rust project";
      };
    };
  };
}
