# 6. Instalación del sistema base

## Optimizar los mirrors

Antes de instalar, optimizamos la lista de mirrors para usar los más rápidos y cercanos.
Esto hace que `pacstrap` sea considerablemente más rápido, especialmente en conexiones lentas o desde Canarias.

```bash
reflector --country Spain --sort rate --save /etc/pacman.d/mirrorlist
```

!!! tip "¿Qué hace esto?"
    `reflector` consulta los mirrors disponibles, los ordena por velocidad y guarda el resultado
    en `/etc/pacman.d/mirrorlist`. `pacman` (y por tanto `pacstrap`) usa ese fichero para saber
    desde dónde descargar los paquetes.

!!! note "Si estás en Canarias o fuera de la península"
    Añade más países para tener más opciones:
    ```bash
    reflector --country Spain,France,Germany --sort rate --save /etc/pacman.d/mirrorlist
    ```

---

## Actualización del catálogo de paquetes

```bash
pacman -Sy
```

## Instalación con `pacstrap`

```bash
pacstrap -K /mnt base base-devel linux linux-firmware sudo ntfs-3g \
    networkmanager curl aria2 zsh neovim grub \
    sddm plasma openssh git
```

!!! info "Arranque UEFI"
    Si el sistema arranca en modo UEFI, instala también `efibootmgr`:

    ```bash
    pacman -S efibootmgr
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
