{ config, ...}:{
  hardware.cpu.amd.updateMicrocode = config.hardware.enableRedistributableFirmware;
  hardware.amdgpu.initrd.enable = true;
}
