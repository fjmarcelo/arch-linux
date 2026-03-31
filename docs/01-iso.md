# 1. Descargar la ISO de Arch Linux

1. Comprobamos si la ISO tiene más de un mes. Si es así, hay que descargar la última. Siempre se publica una nueva cada primero de mes.

2. Descargamos la última versión desde la [página oficial de descargas de Arch Linux](https://archlinux.org/download/).

3. Grabamos la ISO en un USB con **Ventoy** o con la orden `dd`:

```bash
dd if=archlinux-*.iso of=/dev/sdX bs=4M status=progress && sync
```

!!! warning "Atención"
    Sustituye `/dev/sdX` por el dispositivo real de tu USB. Puedes identificarlo con `lsblk`. **Esta operación borrará todos los datos del USB.**

---

## Verificación de integridad y autenticidad

Antes de arrancar la ISO conviene verificar que la descarga es íntegra y auténtica.
Si la ISO está comprometida, todo lo que viene después tampoco es de fiar.

### Comprobar el hash SHA256

En la [página de descargas oficial](https://archlinux.org/download/) encontrarás el hash SHA256 junto al enlace de descarga:

```bash
sha256sum archlinux-*.iso
```

Compara la salida con el valor publicado en la web. Deben coincidir exactamente.

### Verificar la firma GPG

Arch Linux firma todas sus ISOs. Esta verificación garantiza que el fichero no ha sido modificado por terceros:

```bash
gpg --keyserver-options auto-key-retrieve --verify archlinux-*.iso.sig
```

!!! info "Resultado esperado"
    Deberías ver una línea similar a:
    ```
    gpg: Buena firma de "Pierre Schmitz <pierre@archlinux.org>"
    ```
    El aviso sobre clave no certificada es normal si no has firmado la clave tú mismo.

!!! danger "Si el hash o la firma no coinciden"
    No uses esa ISO. Vuelve a descargarla desde un mirror diferente y repite la verificación. Una ISO comprometida puede instalar software malicioso sin que lo notes.
