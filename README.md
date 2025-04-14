# NixOS configuration
This is my nixos configuration. Fully reproducible, using home-manager.

## Machines:
- Zephyr: Dell Latitude 3420 (Intel i3-1125G4, 8GB, 128GB)
- Zephyrwork: Framework Laptop 13 (AMD Ryzen 5 7640u, 16GB, 1TB)

## Information
This config does not support arm/riscv at all, but it's probably possible to make it work with some modifications.
### Zephyr
Due to the machine being low on storage, this is the most lightweight setup I could possibly write for it.
### Zephyrwork
This machine has a lot of storage (compaired to zephyr) so this includes tons of application. But this includes a few hardware specific touches too:
1. Added fingerprint support.
2. Couple (3-4) fixes for the wifi card, as the RZ616 doesn't want to play nice with Linux.
3. Pinned Mesa version, due to the newer versions generating issues like "screen-rash" and "pixel-bath".
4. Includes a small config for niri (the window manager).
5. Includes a setup for QEMU/KVM
### Small differences
The configs also have a couple differences in some utilities used for the same tasks:
- Power Management: Zephyr uses TLD, while Zephyrwork uses auto-cpufreq.
- UI: Polybar and i3wm are modified/overwritten to function better on the specific machines, due to different naming/schemes (basic stuff).

## Screenshots
![image](https://github.com/user-attachments/assets/5501ccce-d48c-49bf-a474-6f4b7fdb3d10)
