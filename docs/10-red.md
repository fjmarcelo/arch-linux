# 10. Red y hostname

## Nombre del equipo (hostname)

```bash
echo Lusitania > /etc/hostname
```

!!! note
    Sustituye `Lusitania` por el nombre que quieras darle a tu equipo.

## Fichero `/etc/hosts`

Añadimos las siguientes líneas:

```
127.0.0.1  localhost
::1        localhost
127.0.1.1  Lusitania
```

---

## Gestión de red

Arch Linux ofrece dos opciones principales. Elige la que corresponda a tu caso de uso:

=== "NetworkManager (escritorio)"

    La opción recomendada si vas a instalar un entorno gráfico. Se integra con GNOME,
    KDE y otros escritorios, y gestiona Wi-Fi, VPN y conexiones móviles automáticamente.

    ```bash
    systemctl enable NetworkManager
    ```

    !!! info
        `NetworkManager` ya está incluido en el `pacstrap` del paso anterior.

=== "systemd-networkd (servidor / minimal)"

    Opción más ligera, adecuada para servidores o instalaciones sin entorno gráfico.
    Requiere configurar un fichero por interfaz en `/etc/systemd/network/`.

    ```bash
    systemctl enable systemd-networkd
    systemctl enable systemd-resolved
    ```

    Crea el fichero de configuración para la interfaz (sustituye `eth0` por el nombre real):

    ```bash
    cat > /etc/systemd/network/20-wired.network << EOF
    [Match]
    Name=eth0

    [Network]
    DHCP=yes
    EOF
    ```

    !!! tip "¿Cómo sé el nombre de mi interfaz?"
        Usa `ip link` para listar las interfaces de red disponibles.
