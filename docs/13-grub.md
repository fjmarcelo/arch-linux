# 13. Cargador de arranque: GRUB

Configuramos GRUB teniendo en cuenta si la placa tiene BIOS o UEFI.

## Instalación con BIOS

=== "Disco mecánico o SSD"

    ```bash
    grub-install --target=i386-pc /dev/sda
    ```

=== "Unidad M.2 (NVMe)"

    ```bash
    grub-install --target=i386-pc /dev/nvme0n1
    ```

## Instalación con UEFI

```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
```

## Guardar la configuración

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

Si no muestra ningún mensaje de error, podemos reiniciar y comprobar que Arch Linux arranca correctamente.

!!! tip "Reinicio"
    Para salir del entorno `chroot` y reiniciar:

    ```bash
    exit
    umount -R /mnt
    reboot
    ```
