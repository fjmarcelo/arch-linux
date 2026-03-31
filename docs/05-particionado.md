# 5. Particionado del disco

En este paso vamos a dividir el disco en particiones. Usaremos `cfdisk`, una herramienta de texto interactiva que resulta más intuitiva que `fdisk` para quien se acerca por primera vez.

## Abrir cfdisk

=== "Disco mecánico o SSD (SATA)"

    ```bash
    cfdisk /dev/sda
    ```

=== "Unidad M.2 (NVMe)"

    ```bash
    cfdisk /dev/nvme0n1
    ```

!!! info "¿Cómo identificar el disco?"
    Usa `lsblk` para ver todos los dispositivos conectados y sus nombres antes de abrir `cfdisk`.

---

## Flujo de trabajo en cfdisk

Al abrir `cfdisk` por primera vez en un disco vacío, se te pedirá elegir el **tipo de tabla de particiones**:

- **`gpt`** → Para sistemas **UEFI** (hardware moderno, recomendado).
- **`dos`** → Para sistemas **BIOS legacy**.

Una vez dentro, sigue estos pasos para **crear cada partición**:

1. Selecciona el espacio **Free space** con las teclas ↑↓.
2. Elige **`[ New ]`** y pulsa ++enter++.
3. Introduce el **tamaño** (p. ej., `512M`, `4G`, `100G`) y pulsa ++enter++.
4. Selecciona **`[ Type ]`** para asignar el tipo correcto:
    - Partición EFI → **EFI System**
    - Partición raíz o home → **Linux filesystem**
    - Swap → **Linux swap**
5. Repite para cada partición del esquema.
6. Cuando hayas creado todas, selecciona **`[ Write ]`**, escribe `yes` para confirmar y luego **`[ Quit ]`**.

!!! warning "Los cambios no se aplican hasta que pulsas Write"
    Puedes rediseñar el esquema libremente. Solo se graban en el disco cuando confirmas con `Write`.

---

## Esquemas de particionado

### Esquema MBR (BIOS legacy)

| Dispositivo   | Punto de montaje | Tipo           | Tamaño recomendado | Formato                       |
|---------------|-----------------|----------------|--------------------|-------------------------------|
| `/dev/sda1`   | `/`             | Linux fs       | 20–50 GiB          | `mkfs.ext4 /dev/sda1`         |
| `/dev/sda2`   | swap            | Linux swap     | 2–4 GiB            | `mkswap /dev/sda2`            |
| `/dev/sda3`   | `/home`         | Linux fs       | Resto del disco    | `mkfs.ext4 /dev/sda3`         |

### Esquema GPT con BIOS

| Dispositivo   | Punto de montaje | Tipo           | Tamaño recomendado | Formato                       |
|---------------|-----------------|----------------|--------------------|-------------------------------|
| `/dev/sda1`   | BIOS boot       | BIOS boot      | 1 MiB              | *(sin formato)*               |
| `/dev/sda2`   | `/`             | Linux fs       | 20–50 GiB          | `mkfs.ext4 /dev/sda2`         |
| `/dev/sda3`   | swap            | Linux swap     | 2–4 GiB            | `mkswap /dev/sda3`            |
| `/dev/sda4`   | `/home`         | Linux fs       | Resto del disco    | `mkfs.ext4 /dev/sda4`         |

### Esquema GPT con EFI (UEFI)

| Dispositivo   | Punto de montaje | Tipo           | Tamaño recomendado | Formato                       |
|---------------|-----------------|----------------|--------------------|-------------------------------|
| `/dev/sda1`   | `/boot` (EFI)   | EFI System     | 512 MiB            | `mkfs.fat -F32 /dev/sda1`     |
| `/dev/sda2`   | `/`             | Linux fs       | 20–50 GiB          | `mkfs.ext4 /dev/sda2`         |
| `/dev/sda3`   | swap            | Linux swap     | 2–4 GiB            | `mkswap /dev/sda3`            |
| `/dev/sda4`   | `/home`         | Linux fs       | Resto del disco    | `mkfs.ext4 /dev/sda4`         |

!!! warning "La partición EFI o BIOS boot debe ser la primera"
    Algunos firmwares fallan si la partición de arranque no está al principio del disco.

---

## Formatear y montar las particiones

Una vez escritas las particiones con `cfdisk`, las formateamos. Ejemplo con esquema GPT+EFI:

```bash
mkfs.fat -F32 /dev/sda1   # EFI
mkfs.ext4 /dev/sda2        # raíz
mkswap /dev/sda3           # swap
mkfs.ext4 /dev/sda4        # home
```

Las montamos en `/mnt`:

```bash
mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot
mount --mkdir /dev/sda4 /mnt/home
swapon /dev/sda3
```

!!! info "Resultado esperado"
    `lsblk` debería mostrar las particiones montadas en sus puntos correspondientes. Si ves un error de `mount`, verifica que el formato de la partición coincide con el sistema de ficheros esperado.
