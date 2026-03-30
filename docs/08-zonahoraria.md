# 8. Zona horaria

Establecemos la zona horaria. En este caso, **Atlántico/Canarias**:

```bash
ln -sf /usr/share/zoneinfo/Atlantic/Canary /etc/localtime
```

!!! tip "Otras zonas horarias"
    Para buscar tu zona: `ls /usr/share/zoneinfo/` o `timedatectl list-timezones | grep Madrid`
    por ejemplo para la España peninsular: `Europe/Madrid`.

A continuación sincronizamos el reloj de hardware:

```bash
hwclock --systohc
```
