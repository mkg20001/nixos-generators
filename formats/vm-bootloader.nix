{ modulesPath, ... }:
{
  imports = [
    "${toString modulesPath}/virtualisation/qemu-vm.nix"
  ];

  virtualisation.qemu.networkingOptions = [
    "-net nic,netdev=user.0,model=virtio"
    "-netdev user,id=user.0\${QEMU_NET_OPTS:+,$QEMU_NET_OPTS},hostfwd=tcp::8088-:80,hostfwd=tcp::8022-:22"
  ];

  virtualisation.useBootLoader = true;

  formatAttr = "vm";
}
