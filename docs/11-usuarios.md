# 11. Usuarios

## Contraseña de root

```bash
passwd
```

## Crear un usuario normal

Crearemos el usuario **viriato** con contraseña **iberia** como ejemplo:

```bash
useradd -m viriato
passwd viriato
```

El parámetro `-m` indica que debe crearse el directorio `/home/viriato`.

## Privilegios sudo para el usuario

!!! danger "Usa siempre `visudo`"
    Nunca edites `/etc/sudoers` directamente con un editor de texto. Un error de sintaxis
    dejaría el sistema sin acceso a `sudo`. Usa `visudo`, que valida la sintaxis antes de guardar:

    ```bash
    EDITOR=nano visudo
    ```

Añadimos la siguiente línea al fichero:

```
viriato ALL=(ALL:ALL) NOPASSWD:ALL
```

Guardamos y cerramos.

!!! warning "Nota de seguridad"
    `NOPASSWD:ALL` elimina la petición de contraseña para `sudo`. Es útil en entornos de
    clase o pruebas, pero **no se recomienda en sistemas en producción**.
