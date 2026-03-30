# 14. Repositorio AUR

El **Arch User Repository (AUR)** es un repositorio comunitario para usuarios de Arch.

Contiene descripciones de paquetes (PKGBUILDs) que permiten compilar un paquete desde el código fuente con `makepkg` y luego instalarlo mediante `pacman`.

El **AUR** se creó para organizar y compartir nuevos paquetes de la comunidad y para ayudar a acelerar la inclusión de paquetes populares en el repositorio oficial.

!!! info "Gestor de AUR"
    La aplicación que usaremos para instalar paquetes del **AUR** será `yay`.
    Consulta el siguiente paso para su instalación.

!!! warning "Seguridad en el AUR"
    Antes de instalar cualquier paquete del AUR, revisa siempre el `PKGBUILD` para asegurarte
    de que no contiene comandos maliciosos. Al ser un repositorio comunitario, los paquetes
    no están auditados por el equipo de Arch.
