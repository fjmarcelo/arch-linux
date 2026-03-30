# 5. Particionado

Usaremos la utilidad `cfdisk`.

=== "Disco mecánico o SSD"

    ```bash
    cfdisk /dev/sda
    ```

=== "Unidad M.2 (NVMe)"

    ```bash
    cfdisk /dev/nvme0n1
    ```

---

## Esquemas de particionado

### Ejemplo MBR (BIOS legacy)

| Dispositivo   | Punto de montaje | Sistema de ficheros | Comando de formato              |
|---------------|-----------------|---------------------|---------------------------------|
| `/dev/sda1`   | `/`             | ext4                | `mkfs.ext4 /dev/sda1`           |
| `/dev/sda2`   | swap            | swap                | `mkswap /dev/sda2`              |
| `/dev/sda3`   | `/home`         | ext4                | `mkfs.ext4 /dev/sda3`           |

> Este esquema es válido tanto para arranque BIOS como UEFI.

---

### Ejemplo GPT con BIOS

| Dispositivo   | Punto de montaje | Sistema de ficheros | Comando de formato              |
|---------------|-----------------|---------------------|---------------------------------|
| `/dev/sda1`   | BIOS boot       | fat32               | `mkfs.fat -F32 /dev/sda1`       |
| `/dev/sda2`   | `/`             | ext4                | `mkfs.ext4 /dev/sda2`           |
| `/dev/sda3`   | swap            | swap                | `mkswap /dev/sda3`              |
| `/dev/sda4`   | `/home`         | ext4                | `mkfs.ext4 /dev/sda4`           |

---

### Ejemplo GPT con EFI (UEFI)

| Dispositivo   | Punto de montaje | Sistema de ficheros | Comando de formato              |
|---------------|-----------------|---------------------|---------------------------------|
| `/dev/sda1`   | EFI (`/boot`)   | fat32               | `mkfs.fat -F32 /dev/sda1`       |
| `/dev/sda2`   | `/`             | ext4                | `mkfs.ext4 /dev/sda2`           |
| `/dev/sda3`   | swap            | swap                | `mkswap /dev/sda3`              |
| `/dev/sda4`   | `/home`         | ext4                | `mkfs.ext4 /dev/sda4`           |

!!! warning "A tener en cuenta"
    Es recomendable que la partición BIOS o EFI sea la primera de todas.

---

## Montaje de las particiones

Sabiendo que `/dev/sda2` será la partición raíz:

```bash
mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot
mount --mkdir /dev/sda4 /mnt/home
swapon /dev/sda3
```
