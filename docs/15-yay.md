# 15. Instalación de `yay`

`yay` es un gestor de paquetes para el AUR que actúa como envoltorio de `pacman`.

## Proceso de instalación

**1. Clonamos el repositorio desde el AUR:**

```bash
git clone https://aur.archlinux.org/yay.git
```

**2. Entramos al directorio y compilamos:**

```bash
cd yay
makepkg -si
```

!!! note "Requisitos"
    `git` y `base-devel` deben estar instalados (ya los incluimos en el `pacstrap`).

## Uso básico

Una vez instalado, `yay` funciona igual que `pacman` pero sin necesitar `sudo`:

```bash
yay -S nombre-del-paquete   # instalar
yay -Syu                    # actualizar el sistema (incluye AUR)
yay -Ss término             # buscar paquetes
```

!!! tip
    Desde este momento puedes usar `yay` para instalar cualquier paquete, tanto de los
    repositorios oficiales como del AUR.
