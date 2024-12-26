{config, ...}: {
  hardware.amdgpu.initrd.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];
  environment.sessionVariables = {
    AQ_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
  };
}
