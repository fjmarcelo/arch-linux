# 10. Configuración de la red

## Nombre del equipo (hostname)

```bash
echo Lusitania > /etc/hostname
```

!!! note
    Sustituye `Lusitania` por el nombre que quieras darle a tu equipo.

## Fichero `/etc/hosts`

Añadimos las siguientes líneas:

```bash
127.0.0.1  localhost
::1        localhost
127.0.1.1  Lusitania
```

## Habilitar NetworkManager

Para que la red se inicie automáticamente al arrancar:

```bash
systemctl enable NetworkManager
```
