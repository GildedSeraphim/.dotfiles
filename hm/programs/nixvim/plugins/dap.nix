{pkgs, ...}: {
  programs.nixvim.plugins.dap-ui.enable = true;
  programs.nixvim.plugins.dap-go = {
    enable = true;
    settings.delve.path = "${pkgs.delve}/bin/dlv";
  };
  programs.nixvim.plugins.dap-virtual-text.enable = true;
  programs.nixvim.plugins.dap = {
    enable = true;
    adapters = {};
    signs = {
      dapBreakpoint = {
        text = "●";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "●";
        texthl = "DapBreakpointCondition";
      };
      dapLogPoint = {
        text = "◆";
        texthl = "DapLogPoint";
      };
    };
  };
}
