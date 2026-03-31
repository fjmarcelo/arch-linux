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

Añadimos una de las siguientes líneas al fichero, según el entorno:

=== "Entorno de clase o prácticas"

    ```
    viriato ALL=(ALL:ALL) NOPASSWD:ALL
    ```

    `NOPASSWD:ALL` elimina la petición de contraseña para `sudo`. Cómodo en clase,
    pero **no recomendado en producción**.

=== "Entorno real (recomendado)"

    ```
    viriato ALL=(ALL:ALL) ALL
    ```

    Configuración estándar: `sudo` pide contraseña en cada sesión. Es la opción correcta
    para cualquier sistema en producción o accesible desde Internet.

Guardamos y cerramos.

!!! tip "¿Por qué importa la diferencia?"
    En un entorno de prácticas, `NOPASSWD` acelera el trabajo. En producción, pedir la contraseña
    es una capa de seguridad que evita que un script malicioso escale privilegios sin interacción del usuario.
