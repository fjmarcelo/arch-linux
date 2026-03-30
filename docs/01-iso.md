# 1. Descargamos la ISO de Arch Linux

1. Comprobamos si la ISO tiene más de un mes. Si es así, hay que descargar la última. Siempre se publica una nueva cada primero de mes.

2. Hay que descargarla desde la [página oficial de descargas de Arch Linux](https://archlinux.org/download/).

3. Tostamos la ISO en un USB con **Ventoy** o con la orden `dd`:

```bash
dd if=archlinux-*.iso of=/dev/sdX bs=4M status=progress && sync
```

!!! warning "Atención"
    Sustituye `/dev/sdX` por el dispositivo real de tu USB. Puedes identificarlo con `lsblk`. **Esta operación borrará todos los datos del USB.**
