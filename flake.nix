{
  description = "Pepper's flake templates";
  outputs = { self, ... }: {
	  templates = {
		  backend = {
			  path = ./backend;
			  description = "A backend written in Rust";
		  };
      elixir = {
        path = ./frontend;
        description = "A frontend written in Elixir/Phoenix";
      }
	  };
  };
}
