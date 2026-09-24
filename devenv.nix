{ pkgs, lib, config, inputs, ... }:

{
  packages = with pkgs;
  [
    ffmpeg
    makemkv
    process-compose
  ];

  languages.python =
  {
    enable = true;
    #version = "3.13";
    package = pkgs.python313;
    venv.enable = true;

    uv =
    {
      enable = true;
      sync.enable = true;  # Auto-sync dependencies on direnv reload
    };
  };

  languages.javascript =
  {
    enable = true;

    npm =
    {
      enable = true;
    };
  };

  # Tell uv to use devenv's venv
  
  env.UV_PROJECT_ENVIRONMENT = "${config.devenv.root}/.devenv/state/venv";

  # See full reference at https://devenv.sh/reference/options/
}
