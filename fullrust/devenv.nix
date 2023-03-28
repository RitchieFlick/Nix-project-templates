{ pkgs, ... }:

{
  env.GREET = "devenv";
  packages = [ pkgs.evcxr ];
  scripts.hello.exec = "echo hello from $GREET";
  scripts.msg.exec = "echo The following should provide a Rust developer environment, including execution of rust-script and a Rust REPL using evcxr.";
  scripts.repl.exec = "evcxr";

  enterShell = ''
    hello
    msg
  '';

  languages.rust.enable = true;
}
