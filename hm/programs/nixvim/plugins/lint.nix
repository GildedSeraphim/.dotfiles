{...}: {
  programs.nixvim = {
    plugins = {
      lint = {
        enbale = true;
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
            "nixd"
          ];
          python = [
            "pylint"
          ];
        };
      };
    };
  };
}
