# 6. Instalación del sistema base

## Actualización del catálogo de paquetes

```bash
pacman -Sy
```

## Instalación con `pacstrap`

=== "BIOS"

    ```bash
    pacstrap -K /mnt base base-devel linux linux-firmware sudo ntfs-3g \
        networkmanager curl aria2 zsh neovim grub \
        sddm plasma openssh git
    ```

=== "UEFI"

    ```bash
    pacstrap -K /mnt base base-devel linux linux-firmware sudo ntfs-3g \
        networkmanager curl aria2 zsh neovim grub efibootmgr \
        sddm plasma openssh git
    ```

---

## Paquetes instalados

| Paquete | Descripción |
|---------|-------------|
| `base` | Conjunto mínimo de paquetes para una instalación básica de Arch Linux. |
| `base-devel` | Herramientas necesarias para compilar software desde el código fuente. |
| `linux` | El propio *kernel*. |
| `linux-firmware` | Controladores para hardware común. |
| `sudo` | Permite ejecutar comandos como root. |
| `ntfs-3g` | Controlador del sistema de archivos NTFS. |
| `networkmanager` | Detección y configuración automática de redes. |
| `curl` | Herramienta de línea de comandos para transferir datos mediante URL. |
| `aria2` | Utilidad de descarga multiprotocolo y multifuente. |
| `zsh` | *Shell* potente, ideal como shell interactivo y de scripting. |
| `neovim` | Editor de texto plano de gran potencia. |
| `grub` | Gestor multiarranque (válido tanto para BIOS como para UEFI). |
| `efibootmgr` | Gestión de entradas de arranque EFI (solo instalaciones UEFI). |
| `sddm` | Gestor de sesión gráfico (*Simple Desktop Display Manager*). |
| `plasma` | Entorno de escritorio KDE Plasma. |
| `openssh` | Protocolo para iniciar sesión en máquinas remotas de forma segura. |
| `git` | Sistema de control de versiones. |
