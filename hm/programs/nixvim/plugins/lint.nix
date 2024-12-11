{pkgs, ...}: {
  home.packages = with pkgs; [
    nixpkgs-lint-community
  ];
  programs.nixvim = {
    plugins = {
      lint = {
        enable = true;
        lintersByFt = {
          clojure = [
            "clj-kondo"
          ];
          dockerfile = [
            "hadolint"
          ];
          inko = [
            "inko"
          ];
          janet = [
            "janet"
          ];
          json = [
            "jsonlint"
          ];
          markdown = [
            "vale"
          ];
          rst = [
            "vale"
          ];
          ruby = [
            "ruby"
          ];
          terraform = [
            "tflint"
          ];
          text = [
            "vale"
          ];
          nix = [
            "nixpkgs-lint"
          ];
          python = [
            "pylint"
          ];
        };
      };
    };
  };
}
