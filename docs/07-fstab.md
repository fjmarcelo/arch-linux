# 7. Generación del fichero fstab

!!! note "Particiones ya montadas"
    Las particiones ya deben estar montadas desde el paso de particionado.
    Si has seguido los pasos anteriores, `/home` ya está montado en `/mnt/home`.

## Generación de fstab

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

## Comprobación

```bash
cat /mnt/etc/fstab
```

Verifica que aparecen todas las particiones correctamente (raíz, boot, home y swap).

## Entrada a la raíz del nuevo sistema

```bash
arch-chroot /mnt
```

A partir de este punto, todos los comandos se ejecutan **dentro del sistema instalado**.
