{
  lib,
  pkgs,
  ...
}:
{
  programs.nixvim.plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        bash = [ "shellcheck" ];
        json = [ "jsonlint" ];
        markdown = [ "vale" ];
        go = [ "golangcilint" ];
        dockerfile = [ "hadolint" ];
        lua = [ "luacheck" ];
        nix = [
          "deadnix"
          "nix"
        ];
        python = [ "pylint" ];
        sh = [ "shellcheck" ];
        yaml = [ "yamllint" ];
      };

      linters = {
        deadnix = {
          cmd = lib.getExe pkgs.deadnix;
        };
        golangcilint = {
          cmd = lib.getExe pkgs.golangci-lint;
        };
        jsonlint = {
          cmd = lib.getExe pkgs.nodePackages.jsonlint;
        };
        luacheck = {
          cmd = lib.getExe pkgs.luaPackages.luacheck;
        };
        pylint = {
          cmd = lib.getExe pkgs.pylint;
        };
        shellcheck = {
          cmd = lib.getExe pkgs.shellcheck;
        };
        statix = {
          cmd = lib.getExe pkgs.statix;
        };
        yamllint = {
          cmd = lib.getExe pkgs.yamllint;
        };
      };
    };
  };
}
